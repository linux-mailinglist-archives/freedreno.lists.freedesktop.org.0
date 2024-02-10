Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71008503B7
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A241E112450;
	Sat, 10 Feb 2024 09:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="we/8+t0u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFCD112456
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:43:59 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc755afdecfso1293602276.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558238; x=1708163038; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
 b=we/8+t0ushi+A67C0UAH4QcGe5UtYj9YHiT0q6tS6DvnUh5BZCni0DQctYZ47/Ij6y
 EkyVClbun17F2hi1OYiSUs3JRp/jOEEKOrGcBGuMwUxTpxpcqlO4+vutZKjLfUI356TW
 Ys4GWXQzip63wBNIVr836VXsYZlzfmQrYMLNz6KkbB2EicJqCfu5/hmHiOXXLEywpmBG
 dKIqoGq2i/iIKTsjgDgh3iG1/G1+aMGrUh2L+9uo28CJ7goh4w7vYYYP/oLCL6To4Whm
 abRxDHnQBytzu/SUs/pOcQpNKm0TQFjwTmaVvPtXxzYcNXzA4fSFcjyxRDs+n0Im/k35
 YMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558238; x=1708163038;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RI3dWBvWyqq/yEA1r1jf7HN95TUMuR4sMgCLHlYNCo=;
 b=W4GJDpPQOFtdmcQGGETAhkaDVVVRYwdZhxzt1IZj0kWuPHgKR7V+amrxwgYUkBIHdL
 DwyJFn8nSHal67bsInP6V+KFxHFgG1+RPINJeF8/n1yjLbIN1prxFTwRWWuka60zksuD
 O3mIfMo1tVETfHPApFCE0NXtSq5thjrlRZ50RsxAeOZgAh+YQwGw7jONQpyfE/OVVvY8
 OvsoN19wQnPN+rVUS/pqKRudFDUJofOpr6kjCCVULe6MJ7atp049YZa/ZKvevu/4pPmu
 qc9KA3uavumcyNiU4KeZbZwX2QULCncEuKIAF8K/DRWsEjpF+JPhKF0yp77j9Wrdgk2r
 /CZw==
X-Gm-Message-State: AOJu0YyInlEwlxTHkFkPnKm5TKv7fujoqug1k+nGoaiCrU5lMQEKccqH
 8psVH7P6RNlumlCI3jtyVYj1bXCqf8V/yHVtf1+jf4hhNzvK+VcKifskceEirO1bzfNwJyf8l3m
 zpRauW95uX03fs2A1BVf+2Q+jo+mtMVihcqcuug==
X-Google-Smtp-Source: AGHT+IGxEsODyIQpa3+puvUQSQAHWgFROHjBlYgNuoD0UH4Y1xDQcQ9joz75lQkRTpTguUXW4Z8MIDNAxAlhshGy4+E=
X-Received: by 2002:a25:246:0:b0:dbd:4883:44ce with SMTP id
 67-20020a250246000000b00dbd488344cemr1345322ybc.32.1707558238734; Sat, 10 Feb
 2024 01:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-9-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-9-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:43:47 +0200
Message-ID: <CAA8EJprtCLn2s3xj1VeOZ4-Ot79PGNfk2Bv8fqPLeGWD71+XNg@mail.gmail.com>
Subject: Re: [PATCH v2 08/19] drm/msm/dp: check if VSC SDP is supported in DP
 programming
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
> In the DP driver, check if VSC SDP is supported and propagate this value
> to dp_panel. In dp_display's dp_mode, the out_fmt_is_yuv_420 parameter
> must also utilize this value since YUV420 is only allowed when VSC SDP
> is supported.
>
> Changes in v2:
>         - Move DP programming when VSC SDP is supported to this patch

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
