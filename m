Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D7AA474A1
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 05:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932AD10EA26;
	Thu, 27 Feb 2025 04:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QcqT53qt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C68C10EA33
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 04:38:06 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5461f2ca386so416240e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 20:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740631085; x=1741235885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
 b=QcqT53qtzxST6egUVt20mwIMNqOQmhtK/JmLjA6o+1rGnpsyTIRcd5F7slBe51Zcwa
 JAzor2JnLo0MOiTl4TnIxGo6b+vMO+G7q1byzcnoiLzchKLgn1sIm80OC8Yjjdyb++5t
 eDl+NRvCiaNGZXRci51XmH3xDhTPRaxgp4X/5a7XxCCTHuUbPu1CH8XPKeQxMXsdkclD
 lYA17UBG/qt7yMlVk5dtWs/xOue/zSOVfSPopedMSuxiCmv4dc+AeGfxtzB3EE54o+/7
 diGhUXHitBZOaQfandhiOp6GKpdrC7FHwIqmn3law4fM4w2azrK+aLXp1g69biQwsBzP
 Qo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740631085; x=1741235885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8Qfog7C+RF4zPzBr1L919bNbTJtyOk3Zvza1VKHBAM=;
 b=qse+IyXrteDUpQp0/rIAr44ZG+dk+GE6N1KxWAOQ3DFyfIzVtr5TEWtOTdSBiX9IHV
 le6sTktNu9pJmT+hMB/nA3IclVg7GY+XqoCSwHnXn7ub3xfS6JzK/xPaTYXi2UqgmOl9
 jBFxaojlvXdoh5hHBMu8tzr1RQ4ceIMkPJXI8rWKfAkPvNVw9L0nlm7cb7uInIRvuxOl
 qTgKL/WTIF0Gvf8wB4zDfaD71fJZMHI7gS5r8HexxgXBmGA+/4y6BmaWN+/BVYP8ZZiP
 g/EMAVem5Trb5YvrTCRYF7quyxaWIrFGRZk3cpagkYPX3RrKf2QJPR0NLTezjGVrqNDQ
 9Mmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXACJjbFUCYjLuIkTNwdYYpT9tk5/bsOJHxer8l5in+mwhPhsds4DLxrb91YUCPf1wVu0xiyBHf4uc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOsel/aY8bhPl1Tgwktmw7WHr5wFOJTBciggo7s3rFG6SezqIr
 u9IoUWyOVvZdemswDe2SEduQDrlF+n5a8N7D4HSXKpE4giihdkLgx2l1KGTCAsA=
X-Gm-Gg: ASbGncuSAM1x9HrAzfqzvTd1W7cgDs0ryf4YHY5l2tzHdqBJDxppADMBLpy9VbfXEtW
 6ucfm4tsrmS9fpI3L/TqEoy154UoOIz4pgyIS/lb+Z+Rh0Ig+3JHKu8mf6mHhgOLmGumMwaiVjh
 URRbf94SH8cCShuyxpNCQffBKznGvXqk1n3mFQBVsb/TkzWkV1Vw+R5MpwbjiLvxpB9nJoJUObQ
 oEMQ9YmIgPaQOieuJZcLxtf8nPEQfb92Qo2sdE71biPdV06W+I44LnUGjQ96gDvHjkyFZCtcuhN
 E/IrvSYC0rOUtd3F0pu64RE5VF5SaLKIucPf1awP+w==
X-Google-Smtp-Source: AGHT+IH6ScpF7u8mldxrlNnCmDDwIVQKTOZg6njtMYsTmsyEuGMk70Dk1+pUhOrMej8BfEuwJN/Jqw==
X-Received: by 2002:a05:6512:3ca5:b0:545:f90:2753 with SMTP id
 2adb3069b0e04-54839147f34mr10569238e87.30.1740631084978; 
 Wed, 26 Feb 2025 20:38:04 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549443ccf45sm63485e87.229.2025.02.26.20.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 20:38:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/4] dt-bindings: display: qcom,
 sm8[56]50-mdss: properly document the interconnect paths
Date: Thu, 27 Feb 2025 06:37:33 +0200
Message-Id: <174063096232.3733075.9096699710834268349.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
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


On Thu, 13 Feb 2025 17:27:55 +0100, Neil Armstrong wrote:
> The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so properly document
> the mdp0-mem and cpu-cfg interconnect entries.
> 
> This fixes the following errors:
> display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
>         from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: display: qcom,sm8550-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e05b233ae13b
[2/4] dt-bindings: display: qcom,sm8650-mdss: explicitly document mdp0-mem and cpu-cfg interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/162c57b8e7a1

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
