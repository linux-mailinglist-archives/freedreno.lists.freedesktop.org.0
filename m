Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D29DB882
	for <lists+freedreno@lfdr.de>; Thu, 28 Nov 2024 14:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B42510E0BD;
	Thu, 28 Nov 2024 13:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S3OnSy/a";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB2310E13B
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 13:24:58 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-53df1e0641fso925224e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 28 Nov 2024 05:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732800296; x=1733405096; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xu+TtrzBU++n85lMLAMaz83aPvmp/GtLgt6yR9tcsxk=;
 b=S3OnSy/amOoEVNMjXmpWB+Ewwfd75vxRmdeBhUdPLK4zJmwevPW/OrUvYTxCStQWFm
 GWZIAcGExSJRhL1RE2/FZKYajplTDvLS7i2oeqsFD+A5GecSthe1aObO5E5zc5z7mia5
 qlJAHzb/+cj9jvDf7pO/SQNOJp8WC7sFQA5BjNHFGcxCtGgcpncAWtwTwljGjUh6F2zz
 7kOR/uBUVfAPEZaJaqXrqLFXDZ1vDB7P8SaJWGi3vDfLzhfKZq3oQAYrNzBCwdV1cHz2
 13JsKIHVANQIdO4HooIdtTGs1Q3vyz5FcTsRlUuHpLeyNTZ3M/Q5+BOBv2RrKYj7x8fp
 vFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732800296; x=1733405096;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xu+TtrzBU++n85lMLAMaz83aPvmp/GtLgt6yR9tcsxk=;
 b=kALn+1xr6cRyQWjHQAMLh/w+gKgv2dyThwhTnDMaxE7v3L0fFN8eQeu7p1w/EYZ3Zn
 o5Nct4s7CtPODjGqglUULCJlkVzlQFVLbHdHgjo9MeRVfBjz9elV14zd4UE+G/XfDZRT
 eFmZ0JqKyYYuWgmC6rUg+Rus5mw0kIiH7f6nZtc4zxpD6YdqffOTrlHpd/207eXYJngu
 qzs1PIG1T5vqnQZFm2cf94B4Na1QuFeZtuDI47qj4ad3NJYDKSgEUszMoIFcQXLZufwi
 nFZnoOkIBDx60bQBHYL2vyV04GUkyrzFHdHM5codHBRtwCzD2Ow/IlNeTbv7+IBrIGYJ
 kATQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVS31XPORDlZnqck5sCtScJQI7VOa46BY0v6auMX0NUQGbzb8TkAqHsxWDAN+gh07KcsjCvwlh3N4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwshxeJuYcU6ewPKCzLJ3cMEv74aHldcKdoJjOx61w0Zv39T+rQ
 HdDUYYyihskT3D8IpeHCPEK70wa9P0FkrK9RJEWsKHFw+Bsr0P8iMtoOTf/GTOA=
X-Gm-Gg: ASbGncu+PihPJdjRZUqVCfr4Zf3os8jr3yB5k0goZbpyvdmt8zWHWQVD59WPVAr+ND9
 u7vbsEGCWwktl5+GtfTKSQnDgzmL+CtVRWgVMGCEZqo3jyVM+vCyimTvyTmFqKCMcoDO2/o4iss
 ClJgZrX5Srd+/jty1iep4ws7J31c4cD67CXvg8AZq68jMdx+zI3C/ByDzTnm357NETr1FK/gH3N
 RYOyaoXtar+bh4pvAWno5XeKXWz4LW+SNXcdtFHh1MEkkQaDU0knINm+KR4WoibXCI2MQp2/ALU
 vrWE7w5txzm5gAxlzRqsFIQyMaqe3w==
X-Google-Smtp-Source: AGHT+IEpZe9yoi47jMikkocK38/MKcOL4vKUAWk7lAfQh1r/azAfrCwMc0oz7RX7DyOhdOTWypto/Q==
X-Received: by 2002:a05:6512:a90:b0:53d:ef49:5b5a with SMTP id
 2adb3069b0e04-53df00c6057mr4150533e87.1.1732800296195; 
 Thu, 28 Nov 2024 05:24:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df644313bsm175297e87.69.2024.11.28.05.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 05:24:55 -0800 (PST)
Date: Thu, 28 Nov 2024 15:24:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/7] drm/msm: adreno: add defines for gpu & gmu
 frequency table sizes
Message-ID: <emsraqtyxkanfzafej45dt47hdx37okvngomqgou35a47uly6k@5w6iwq6xfjul>
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-topic-sm8x50-gpu-bw-vote-v3-1-81d60c10fb73@linaro.org>
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

On Thu, Nov 28, 2024 at 11:25:41AM +0100, Neil Armstrong wrote:
> Even if the code uses ARRAY_SIZE() to fill those tables,
> it's still a best practice to not use magic values for
> tables in structs.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
