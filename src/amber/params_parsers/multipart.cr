module ParamsParsers
  module Multipart
    def self.parse(request : HTTP::Request) : Tuple(Parameters, Files)
      multipart_params = Parameters.new
      files = Files.new

      HTTP::FormData.parse(request) do |upload|
        next unless upload
        filename = upload.filename
        if filename.is_a?(String) && !filename.empty?
          files[upload.name] = File.new(upload: upload)
        else
          multipart_params[upload.name] = upload.body.gets_to_end
        end
      end
      {multipart_params, files}
    end
  end
end
