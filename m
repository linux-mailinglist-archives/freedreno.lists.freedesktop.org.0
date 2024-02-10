Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8BA850436
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 12:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB59C10FE8D;
	Sat, 10 Feb 2024 11:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GioHjRXf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC6010FE8D
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 11:31:31 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id
 5614622812f47-3bbbc6e51d0so1203146b6e.3
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 03:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707564690; x=1708169490; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
 b=GioHjRXfn/+vb4Y+pBg71NtkWIKCqPcOfTaVbrEgZOaD+Pcs5WrXULLt2cg3uzEZzP
 pdn8sUZ0LgugZFEJQj75XPBlkEX6mAgxvwpET9HuUv0BY9tJ3+LbDIL3cWJxlpWEtwaQ
 tCsZyTLS3hw+UyszBWlsmF2BB0wHr3nDw9gLQA9hcvv1ifNPuE5//QnTKhVQz0dn1WuG
 LZvfzq3Jh+IQGuquuRugXY44XYLNjl2+5GSXyv32YQ58LzcFWTyuZ9of0mr3PBOeG+om
 MxwHkCaeckspY8Ms/5oaGDNk52vL7z2EwGe+kGx8sAY0XWP/iMJDrbawx65y18U0nCvG
 Kkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707564690; x=1708169490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M4AqEzTtCCjUhsIjO6HajtAUGJbh5B0Lu9dEnEpAroI=;
 b=s307t+6nFoTm4/SRGDJuDomAoLtc2esQRIAsKwr6CnZxwQBxj1NXz43bxLFrU2TXh1
 LC87qpoxCLnJMZUhoUtm7fqokgepQIAsDaxajXw1dAbr2UBgeatILUC46LwbzCarGmHH
 ybNbgO2KUltgsoBdVP71oEAHgURORpitA4rAtjvumX4Q/9u3C0YXPwWM8iBN2IiKbes3
 cu0idN3/wsEe9nkDSvdYXbBW85QPRt3Z8tXhgzAp4XSjbBCDIW26M+pJ2blWCxBEr4q9
 yT1LQAK9UsocUvYnQ0W+IBnOMTMGyYr05Wn/POSKKvc5PNblbbKvoWH5TN9CgUdlLRcr
 89/Q==
X-Gm-Message-State: AOJu0Yzryv4eq61rwLlfOxJQ344+XuKamY8i1VuTrwb1i+GQcOHSbwGX
 +L2K8eg8okDddCU9puTBP4XQD2r8faWP8ceKf834+8jvqe65l8Pp8K4608iyLVE5AOub/D08e+v
 1eR9M6RtUwwv0qCKvbLWUHdfAGemaerP5IPH7LQ==
X-Google-Smtp-Source: AGHT+IEwbU4Urd+epmxc0Oq7zQyb2ah5l24AnSJhfOyIVqyt2jvHOugDdn5MyWEy7q3O4vfsPa7YZCHwU1rvF2/qAyg=
X-Received: by 2002:a05:6358:199e:b0:178:8cc8:4c7b with SMTP id
 v30-20020a056358199e00b001788cc84c7bmr3127825rwn.24.1707564689944; Sat, 10
 Feb 2024 03:31:29 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-19-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-19-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 13:31:18 +0200
Message-ID: <CAA8EJppnT2Rfi8R0yiSwD8TJCw9JS4Q4sVrgUjYg36qMTr85EQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] drm/msm/dpu: reserve CDM blocks for DP if mode
 is YUV420
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Reserve CDM blocks for DP if the mode format is YUV420. Currently this
> reservation only works for writeback and DP if the format is YUV420. But
> this can be easily extented to other YUV formats for DP.
>
> Changes in v2:
>         - Minor code simplification
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
