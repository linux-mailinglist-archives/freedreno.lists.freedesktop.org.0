Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4E8022DB
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:27:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117BB10E27F;
	Sun,  3 Dec 2023 11:26:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959C710E13C
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:26:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so2031398e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701602799; x=1702207599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRBX9qjaYScewEyAGN3ZWpm24vfD1L73uIHC1C0KO4Y=;
 b=eQS2mMTYc2zPU0SEkJhbKglu81OyS4WSpwTABnUUUYR7du1On5UWWo6FSz5IfqxfAy
 rEnI+djjOP0XM04t+E3EEEkoSAnHmsmNIZkt+cwk0KNZLHhKEfes9HvXZjiAm1c143++
 BpcAl5UTmCG0vBz5Y4L8nvctTEooCFGlXKDyPNoWL3pt/mHPAiol3tOMFBdG9SyNmHmO
 WpDS/amZeNPaRTur1kjtzoB7X/fsVFtcJqEl1PGgrVkWOjEIMtytxkAxohpUIysH/WGG
 JaZOZTuWVKBapMoqxguJVnSzf4NjPFSEI9kbVbjU/vTtiN8wmZanhEChtsSJuMCCN8oz
 RDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701602799; x=1702207599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRBX9qjaYScewEyAGN3ZWpm24vfD1L73uIHC1C0KO4Y=;
 b=tXQ5JKiUexV1hezs0fwio1MfExwq7o/5ScTdE4mSXuZ5UV8k62G6f49w82NKb1yhoN
 tmgfGqaBHsX/C9JSk6Q0ENjoZTlKV71BesBECdrHVZzGGNcJfRIRIXFhOoGlPivEVYIr
 czJYuOs3uRL0nL/QURLOjxuc00jONLDh+nzp2eH6qZTaGX8mBNWfnwakbRsQa40WTVaI
 Sz35QHiMioWPS7XJFXruKPryouqsxn3tRTLo9POGMZ5eK655GtHvI832nt73ZpFIulXw
 lpbm1jLckAt69txzizC4Easq3qFc2/VESotBIzaocmLLyqLULxRr0KLpTxEUVDq7xd7z
 HHdQ==
X-Gm-Message-State: AOJu0Yyog3gl9WuVJire4CsKF0EI52GfttHLgJ5m8oGW/hLjH385hcvo
 g8M+jsEVbGEiFcfhP8LYWckjeA==
X-Google-Smtp-Source: AGHT+IEo2kVrDxKWsLCcwvE8hl19v/Tnab9g7q9epanULPqx4nYnbkuhxAF8ZygQf6iwFdwfxMYOiw==
X-Received: by 2002:ac2:442f:0:b0:50b:d764:6e9c with SMTP id
 w15-20020ac2442f000000b0050bd7646e9cmr1980872lfl.76.1701602798822; 
 Sun, 03 Dec 2023 03:26:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b9-20020ac25629000000b0050bf01760a1sm241224lff.295.2023.12.03.03.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:26:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sun,  3 Dec 2023 14:26:23 +0300
Message-Id: <170160265544.1305159.7127586815591334441.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 00/12] RB1/QCM2290 features
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Wed, 29 Nov 2023 15:43:57 +0100, Konrad Dybcio wrote:
> This series brings:
> - interconnect plumbing
> - display setup
> 
> for QCM2290/QRB2210 and
> 
> - CAN bus controller
> - HDMI display
> - wifi fw variant name
> 
> [...]

Applied, thanks!

[01/12] dt-bindings: display: msm: qcm2290-mdss: Use the non-deprecated DSI compat
        https://gitlab.freedesktop.org/lumag/msm/-/commit/25daacc60394
[02/12] dt-bindings: display: msm: Add reg bus and rotator interconnects
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a1ed5860efd3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
