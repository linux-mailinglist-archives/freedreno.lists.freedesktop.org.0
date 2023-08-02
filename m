Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDCB76C9E2
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 11:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0841410E531;
	Wed,  2 Aug 2023 09:55:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C645710E1EB
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:50 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so11079834e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970149; x=1691574949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4fO+AuiVRXnIWsvnH1Ymd8k44f0ol+itxsyVxim6v8M=;
 b=tgNYgj0qIVjuGJlhO1zwYOJH4wDFFO6KHVSXvswSIwBtQ+/sYgG691hrwILiC1l4fQ
 YBla4vPJnmF7yHXGj1SFGXjhJnyQXVvK3Zys+m9tysCyj9iKNCRBWTkImVN4e/U8P5si
 bqKOTTePkxm9Cb66SB8agjMYM97Q+R/95WFdDG32Dt4p8hgTIKEDgLgrmC0w9DSky2AU
 CzRctUk3TjJE8J4lfu13dvQaORdhoZwGK7HGSYlnZqYNb97438KwqpwOggtu/P9QDkci
 QM0YWXCx6CKUHqz2Z5483tIMrpyjZl/ZEh45RdOS4Er9w0vzIHtyIl4185JS05TnNyAU
 k/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970149; x=1691574949;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4fO+AuiVRXnIWsvnH1Ymd8k44f0ol+itxsyVxim6v8M=;
 b=Gu4SRAv65q8HqCx8sp3rE/ER/58OLumjq5KbrxmoBFws19kvM30GMCBarQuBTqey9S
 aWDfkDGS4LLmNuHEaPdfCO6w+7EgFnXbgKOer2Ru/RDdKm03gNkv8fVQS7o0M3ArV651
 KtBhZWOr5htYMofK4G0R02MyMn8C8uMQW2N9qdbK7vQ2Yj8mkWza+1grkj98M3bXBDGy
 r2pIHJ86GPkc42WyG0u2eYMnlZmrBceuGvMeRXESwGJhZoJHNysyI9rNhQUtGdiPe6lc
 06mHi6pznHgg1Jmx06EPhnK8Irp7Z3/AyQt0TqsJJzXtD5yaFeHjQ3kbEnTqSnUhr/bJ
 1zkQ==
X-Gm-Message-State: ABy/qLai7pPP47we7orgu128Etbde7sfivRcx4llRNk9er6Rfwy10GI9
 l00/eVoYnlt4SaicrCGJMV7+Uw==
X-Google-Smtp-Source: APBJJlHD5g/pdDFypWkagFMBOYMpMJqGT86QHOcjMvKmPVNZOHb8bVtcsSWxDrKY2x9petM3Rh0m/A==
X-Received: by 2002:a05:6512:210d:b0:4f9:607a:6508 with SMTP id
 q13-20020a056512210d00b004f9607a6508mr3674568lfr.50.1690970149138; 
 Wed, 02 Aug 2023 02:55:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed,  2 Aug 2023 12:55:44 +0300
Message-Id: <169096995979.4183272.6945196622570657421.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
References: <20230727144543.1483630-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/5] drm/msm/dpu: rework interrupt
 handling
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


On Thu, 27 Jul 2023 17:45:38 +0300, Dmitry Baryshkov wrote:
> Please exuse me for the spam, I missed the triggered WARN_ON because of
> the dropped patch.
> 
> Declaring the mask of supported interrupts proved to be error-prone. It
> is very easy to add a bit with no corresponding backing block or to miss
> the INTF TE bit. Replace this static configuration with the irq mask
> calculated from the HW catalog data.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: inline __intr_offset
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c54b4c35194e
[2/5] drm/msm/dpu: split interrupt address arrays
      https://gitlab.freedesktop.org/lumag/msm/-/commit/370891f0d983
[3/5] drm/msm/dpu: autodetect supported interrupts
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf8198cc3b90
[4/5] drm/msm/dpu: drop now-unused mdss_irqs field from hw catalog
      https://gitlab.freedesktop.org/lumag/msm/-/commit/40f9cedf54f1
[5/5] drm/msm/dpu: drop compatibility INTR defines
      https://gitlab.freedesktop.org/lumag/msm/-/commit/edb34ac1f65e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
