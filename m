Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0F296CD43
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04DAF10E508;
	Thu,  5 Sep 2024 03:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="V88KtSm3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C5010E4F8
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:41 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f5064816edso2742741fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507220; x=1726112020; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
 b=V88KtSm31z3kgU7GHL0CidfPQZ5HZfbKRnqCBV2OSLGoM8WUogUuYAJ+qzrkmqGnl1
 zZdiovB53R+nXodScn/3YEkpEB9woBqH4p62cfeUbBmmv7XSu+HUoXIh1nGFalbZxceZ
 HXqWghZ13BychsuRMPQvbh6+iJ6ZCrJT6um8pP8nTqNAOh0uTSj0MEdIy18nJY6X/rU5
 k3qHegK9a5lJEzxRmWOr0xs1koaxl44iKyzFdR6LpEZBSUEm7XKkhSKODOAjG7DZ+RV5
 HuzvcCksv8W4a8J1TMXcTLJfQ+z/Bq492RkccFbqHxsjgHLuXcBgYwpKJS61TYq7e/x8
 5X7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507220; x=1726112020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gHqDfVFz4e4ch7Qvu8SgYzoITxtA7TzKSa28k2tmaC0=;
 b=TLZ8YrKmekjXNJtyzJ30B44yY/x5jX71wgvZjBOKzCKJrbJAubwX4Ok+TWISSlyDV8
 fOjou1ai0K/y1YnPH7/O7HFychd+bt5ny4oc0snIf+BW05/0FDW1ZHEgBpq10XhEg7Z5
 J+N0sc5M0aY2w/7e1ugzPnfOsJ1P7i9kghzuw4TxZ8JGbiBpzSMSp5tPnVZGa6vZ0m4s
 zJKCFAhDoQNZ9z0mM/dReO6pSOnhzpeyNy/L1G+toP65HpVK9sVgbkXwyTDWa+D3Wigv
 RlY50zZJKV7t3TF+ONLUMiVCMP1ZrDKBZxsjKHi/qi+JtezBCL5+HoQd9s9h6yv33NLi
 bGCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyue6rKmYu5l2M2OtMibQ4CH4fa867550iRVPxOty8sTW/TE/YURSKor3neo5RFxzleHA7ZMKosOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBFFiJhTgFexpFc4PLMrqbeQl6ajDmaKlmf8HTVbD65GbgiVm5
 PrAo3fkdA+6d+0YIBeyU8500xQuz7iHrkqv29GdKpmNco3mm6/i3pfh3n95hw7I=
X-Google-Smtp-Source: AGHT+IF8RYrZhm6Rb+d5KJJUucAgU85MelFmmJWy0tHStryL1PjwkJENosRYCfI0WLW1G2JNywVluQ==
X-Received: by 2002:ac2:4e0d:0:b0:52f:d69e:bb38 with SMTP id
 2adb3069b0e04-53546afd7c6mr13901020e87.2.1725507219347; 
 Wed, 04 Sep 2024 20:33:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mike Tipton <quic_mdtipton@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 00/11] arm64: qcom: set of fixes for SM8350 platform
Date: Thu,  5 Sep 2024 06:33:33 +0300
Message-Id: <172550712140.3299484.13498001864474908780.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Sun, 04 Aug 2024 08:40:04 +0300, Dmitry Baryshkov wrote:
> A set of fixes that target stability of the SM8350 platform.
> 
> 

Applied, thanks!

[03/11] drm/msm/dsi: correct programming sequence for SM8350 / SM8450
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1328cb7c34bf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
