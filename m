Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46923858F1B
	for <lists+freedreno@lfdr.de>; Sat, 17 Feb 2024 12:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BADF10E2AA;
	Sat, 17 Feb 2024 11:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tFTGe24g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D52A10E202
 for <freedreno@lists.freedesktop.org>; Sat, 17 Feb 2024 11:39:51 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563cb3ba9daso2493709a12.3
 for <freedreno@lists.freedesktop.org>; Sat, 17 Feb 2024 03:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708169989; x=1708774789; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1C+Hkp9mF5Xdg3l0hgYcA9Z6irk/GvuEVb1RZfBg7lc=;
 b=tFTGe24gkDePc5zek43Pc9VhMWAgs5NiumxIrtqkqfyJmrfjfIneXpnXOQ/Skpi4dM
 mLylbYkGfsAGMzsSSYfR2QXQXWogej1CvD30IB20mkTkozJNKoQRbiqEMNoI/KQXdr/o
 2c3XumbR5rhaxkltwq7499aVeImgEXkY0IHJS/nxkL2elRSV+/oPHGqGfXujP6rUpAHn
 CNrHFw/IzDooeF3sjtEaqR8fYi3AQMv7XRBhxciayZ7JGrPSizU+Vr1qltVD6PSVc/8v
 G+LxVfWWoRGJ5PpsDTOsktpxIMahUWj9o9W1YNzp7JAPQB+4PYYYfRKPleo4AUJ++xLL
 wqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708169989; x=1708774789;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1C+Hkp9mF5Xdg3l0hgYcA9Z6irk/GvuEVb1RZfBg7lc=;
 b=DANJAxD2H8yjlXvbazG9nDk3dju9C9BhUVpXUK8T0dDBfBEfVWzkMCF0PukpQNDJC5
 muG7876nThyW+O29W/tNn8qApZubYGRYCKV143jjyMnBWcckMwbDZA3CWMpn4Ml543/k
 qul2RPWSa0c2yLpcTy3s89i2u86LBYlBnMRKPmY3hJ459ugISQUBCYOGxbKZjR0guib9
 UFC1fxfJgb8w2eOk3/G8z+GzQOUMbCTRuGRrP/M6cA8bwHBlVWH2YBC385dekPuJTw8t
 Swrfkj38HFAUophCihlLQkRxw0IF8FWp1O+4bw5UiwPAWENJsezkC350a0HH/UiUJ8eY
 7q6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOZFSv58+6yk6EXcJTOYzjxLwzci2EMyT++9d+jgmxvXYjCbQUWagM9m2jl4TTEdg4fe0IZqOaIE+KALcdlioCitpTJxea7ahEKnWcZss2
X-Gm-Message-State: AOJu0YwEICE62TIre272AKJl3SeCcdLSSJLhDZYQQKTvX5Wd2DITOOHX
 Ww89eYZTV4jSE20AGDRXYf1EJzLnriC3HFpj5K7KH3k3E+wPK9cfyNlPmBYR9Wc=
X-Google-Smtp-Source: AGHT+IHC8q9jk1V+NICBbpC1WNnMyrhtKdpmvofzMtMFylRK1DYfLGy8RvSLVqogHDYFEu79JIpj6g==
X-Received: by 2002:aa7:d313:0:b0:564:2fbb:a869 with SMTP id
 p19-20020aa7d313000000b005642fbba869mr524179edq.38.1708169989449; 
 Sat, 17 Feb 2024 03:39:49 -0800 (PST)
Received: from linaro.org ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 ek23-20020a056402371700b0055edfb81384sm803108edb.60.2024.02.17.03.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 03:39:48 -0800 (PST)
Date: Sat, 17 Feb 2024 13:39:46 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: Document MDSS on X1E80100
Message-ID: <ZdCbAjnga8HCMdYf@linaro.org>
References: <20240216-x1e80100-display-v3-0-28b1c33ac8c0@linaro.org>
 <20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org>
 <170810832158.3497594.1997532394027797497.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170810832158.3497594.1997532394027797497.robh@kernel.org>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24-02-16 12:32:02, Rob Herring wrote:
> 
> On Fri, 16 Feb 2024 19:01:06 +0200, Abel Vesa wrote:
> > Document the MDSS hardware found on the Qualcomm X1E80100 platform.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 253 +++++++++++++++++++++
> >  1 file changed, 253 insertions(+)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dts:24:18: fatal error: dt-bindings/clock/qcom,x1e80100-dispcc.h: No such file or directory
>    24 |         #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1428: dt_binding_check] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
> 

These bindings headers are already in -next.

> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240216-x1e80100-display-v3-2-28b1c33ac8c0@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
