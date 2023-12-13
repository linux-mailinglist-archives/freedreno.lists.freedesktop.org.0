Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94E8106B7
	for <lists+freedreno@lfdr.de>; Wed, 13 Dec 2023 01:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ABC110E22A;
	Wed, 13 Dec 2023 00:37:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E6310E226
 for <freedreno@lists.freedesktop.org>; Wed, 13 Dec 2023 00:37:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so7185425e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 12 Dec 2023 16:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702427858; x=1703032658; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k7k/V39rRtO0gu3kma7GBDeady/50PeXiMUR6JPR3gM=;
 b=Sb9QKXTY6Lymn6LpKhGzyP5Vam7k5V5AREEf1R9euDJjOCco8gB+Z0H3kAg3qnMnGF
 pNJlBfdQxrMjNBSJXZxeypvICMwFWIpPRKmG0CUjZwEUhf296vRSQbRcsxptgKdMkyx/
 WflyOxqpVPiS676OAtZ47lDWFlMR8nz3qm4he/FemYVI0UybSYe4pXzqi4VvjsNa9gul
 w++KVfg/wkX8MfLnuGO7FJ81JVJ/g93TStkVFT3TNfdmDerV0Hn9UOTLT4a+gvTtNm/L
 mgutEIk82JzzcSy1skDFpEYw/oVnmfBifCHfgrXLlAEliBHiuinWhrFGcJ3onYdqXSUI
 r/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702427858; x=1703032658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k7k/V39rRtO0gu3kma7GBDeady/50PeXiMUR6JPR3gM=;
 b=Z5IHSJQ9LUIWXyWb84gZ2spnO+LaUNw7V4fDnHK1r0GCZYnpKpsDT0TtpQzC4FEdiP
 3rOACV5kkAJPWOtC83LcC/TcihdWZGMhKUtC4pbHwkrUg2MU8DaVrQrhPHUVaWAcvzHC
 zFCWp8pxSMlECVZ+2TIjbvQb+Gk+UmJQwtETkvcsNyVrPISWEhMwaS24HzoA//LoLQUx
 A5n/2g/eEpg38Y0UQlN0ael8Vf5p0nLUvBGTbaE8xC7tec9D8+Ftgekuw6rgnq3MwiBH
 lbXOpJgUF9hCE2aghlpz74XEekEqyv8uQWAtqBaNzjlO8iiKd3T03W4tY2frinFFfbty
 hoJg==
X-Gm-Message-State: AOJu0Yw/5XImCRE+CfUZTIX5NN1BWX0F0SIWhkbTlq2gk56WK8t2KCVf
 IXAaUTD9fLSLGRw7HID3487yAA==
X-Google-Smtp-Source: AGHT+IGE9Db6y1Dp0Tz5IuwllQVF7GN18pg+hEKPwP1GOohVNZRzQKzU5fKx57ILT9BVICNh7+Ixow==
X-Received: by 2002:a19:7706:0:b0:50c:f227:ac0c with SMTP id
 s6-20020a197706000000b0050cf227ac0cmr2893314lfc.10.1702427858308; 
 Tue, 12 Dec 2023 16:37:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a4-20020a194f44000000b0050bef1c5a50sm1517467lfk.267.2023.12.12.16.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 16:37:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 0/3] drm/msm/dpu: enable writeback on several platforms
Date: Wed, 13 Dec 2023 02:37:31 +0200
Message-Id: <170242755506.12964.4576140189504852980.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
References: <20231203002743.1291956-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 03 Dec 2023 03:27:40 +0300, Dmitry Baryshkov wrote:
> This enables writeback on several platforms where I could actually test
> it.
> 
> Changes since v1:
> - Fixed the CLK_CTRL for SDM845 platform.
> 
> Dmitry Baryshkov (3):
>   drm/msm/dpu: enable writeback on SDM845
>   drm/msm/dpu: enable writeback on SM8350
>   drm/msm/dpu: enable writeback on SM8450
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: enable writeback on SDM845
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d907efe518e4
[2/3] drm/msm/dpu: enable writeback on SM8350
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1a8dfd51d6e4
[3/3] drm/msm/dpu: enable writeback on SM8450
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e512b4a8ec37

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
