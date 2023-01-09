Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 964FA6635A1
	for <lists+freedreno@lfdr.de>; Tue, 10 Jan 2023 00:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6E010E51C;
	Mon,  9 Jan 2023 23:44:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165710E518
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 23:44:07 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j17so15618971lfr.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 15:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2ILC0s/EAU+DV83P6Wz26LirhdaLi4CEI3lPCyUm7s=;
 b=SCvtPla8vRT2nzGbX8bZCBvG1/UsYY6j9CccyXHnWODwEmM4R7Il8lt74yhlbfkrFG
 oaeywk7xMz+UgkLoze5huZ2nPADrqG2AUryZw6EYQbf3j2R70rcFEG79ScrU1l2pJaZp
 Go/A5XPGLC1ILp4uSUvnk9wVIEW3Xd0/1ywVmIj1n5FD99iYBPu6l/hrhlqiBExA/14z
 W09j4PcO2onTqvbwDbtwL57MeHQXC2sRPgA6QYBdMMOq1f/8ciVAeIOMiV7jAPUnxO7x
 mu32t23lrNmAaTY4t5G41BfpBW713q2CCAMkdWAT0dW8QdpG796/juAp7bUwsWLmOHt5
 OLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P2ILC0s/EAU+DV83P6Wz26LirhdaLi4CEI3lPCyUm7s=;
 b=vr6cftaIptSkzwuFmGLTgLNqakplVtfS4ODfKa9detBtg6Hw/Qz8V7GtUr2EilgFqd
 kg9Rj8XP0WjQiMkFBHTHsVOOVOVoFLBOIk4d/4FOu9mqqW8nDO9DwlBg20UrZe7Uj1lL
 7nDNC5QPEsHbPvnCFOFqP6Wo5CeW1MMyNdYTTDb8s0TYCeHqhfoFVK7g0DRX3/PK8/T/
 /EatwBxLpF/GXml31MbgWO5Eh4/c1UQaa3xockImIkTQez+H/xYpn90yP2QPHRL7bDLF
 zOH+l6P43A040l0TzIpWO6+euN/9UVOUW0DdWHB4DgygATyZfR6Br7pE10PwOXHtiISm
 L9+g==
X-Gm-Message-State: AFqh2kr7AQG2JC1vDtjFdOsp5Lu6mEWsMFgBxOhE+E21BlPyBREFLQ8a
 vxf2NNg5wik8P4MyYxzMUs/JcQ==
X-Google-Smtp-Source: AMrXdXu/IjK8CLIFRBP/OvhD+9PARQuHtXgB6Wi4ihe7XAQpCf5o/DB+lyKbwXvdNcwzJVJp1EZOlg==
X-Received: by 2002:a05:6512:2591:b0:4b5:5bc1:678c with SMTP id
 bf17-20020a056512259100b004b55bc1678cmr18912405lfb.21.1673307846247; 
 Mon, 09 Jan 2023 15:44:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s9-20020a056512214900b004b5a4cf69dfsm1835255lfr.261.2023.01.09.15.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 15:44:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 10 Jan 2023 01:43:50 +0200
Message-Id: <167330408777.609993.10625838053126899594.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229100511.979972-1-konrad.dybcio@linaro.org>
References: <20221229100511.979972-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 1/3] dt-bindings: display/msm: Add SM8150
 MDSS & DPU
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Thu, 29 Dec 2022 11:05:08 +0100, Konrad Dybcio wrote:
> Add bindings for the display hardware on SM8150.
> 
> 

Applied, thanks!

[1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/9ffbefc1553c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
