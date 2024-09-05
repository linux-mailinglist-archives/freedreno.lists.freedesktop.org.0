Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33E96CD4A
	for <lists+freedreno@lfdr.de>; Thu,  5 Sep 2024 05:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9682F10E662;
	Thu,  5 Sep 2024 03:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E17UN+Mg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88F610E609
 for <freedreno@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53567b4c3f4so211603e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507223; x=1726112023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
 b=E17UN+Mg6Fk33rxKs9O+I9HPWVyuAurNVDObTygVJSKfyHPCF2IB2PkNJHjmOTmtjx
 /ABp5pT2OsF1rZk/5F7ZCAXFUEeDsqpvKXZhRLk99IrdJqCJl02j/CWkPGHdzV7DizEU
 QxSZBS4r4HCdIcotC8BJtU5kq+fmz9X3yoKFWzn/Obzc4e3tupctylr9HwaBdE4ZVjt4
 5HpjbmHrG+7/g7Lq68yxOXPu95oAAPZsWrzjwOyKAiTHBJwkyo1NG7bGpZW/3II8ABFr
 Sr10WfpZnNzTHD3jlOb0x4q4gHvsbz5V1xwJC5zYvr3ezCqthTeixjwIugMVr23hKgEi
 QCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507223; x=1726112023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
 b=ABaeA3hePKL8g5ZMuKOPg3fibQbPm6KvcNyioOYzRs4t/1/4msExfmuo5/NWoJHsdY
 7gs76ruvApthKCYLmo+EOZto2pajLyM+EVs9m/O6rSL0AX7IXXupV3L73m12efdI+VJA
 hX96ojGpYbn5vpfhtsI/4N/E+DtMTgMdsctJflmneDQbDtuWV1BaK3vnS9iJB+w9DIK3
 pAqU/AC4/BlncoJcowoSrkyCIVwvIVivRsT5R/QGH+tIBLcMjSYMFTChLODkV32Pf6EN
 LBVUDa5flMNw0pa/7SSTFCz/sQ4+TXdYKzD4zSLw18U4IXjJC/Z2ctrLZdNZXcg+KGZL
 hqjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEzJA6vXzfR+Z5XhDqgqlXe7Vj/4UE7tZCk8VyK9/mI6cCsBfgCor2pDCDiv2V/HhOWzQfCLf7Iis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6qcY3JJSMFPUVWTwgdnDbGNSea0g6b2DcY+Hoe7ekeDTPb/Qq
 xTtZDOonrq7bM4EXfkACGvCf9yrxXHIrjm/uSYEEPCp7WlY1iS+cGUGbyO2sEUk=
X-Google-Smtp-Source: AGHT+IGI1ThGNwiYzgjZpB38Gzh3Kii8Shn3E44t5s6JycEWNTDgK8ZwOGUE8abD1/FHADwkhMcSXg==
X-Received: by 2002:a05:6512:6d2:b0:533:44c6:1ef1 with SMTP id
 2adb3069b0e04-53546baacc4mr12832555e87.56.1725507222640; 
 Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/6] HDMI TX support in msm8998
Date: Thu,  5 Sep 2024 06:33:36 +0300
Message-Id: <172550712143.3299484.1580127137460046609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
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


On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 

Applied, thanks!

[1/6] dt-bindings: phy: add qcom,hdmi-phy-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8886def25eef
[2/6] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/656810411b1d
[3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a61eb17f40e8
[4/6] drm/msm: add msm8998 hdmi phy/pll support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/caedbf17c48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
