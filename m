Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D980B74F1D5
	for <lists+freedreno@lfdr.de>; Tue, 11 Jul 2023 16:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA5FB10E3B4;
	Tue, 11 Jul 2023 14:22:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66A610E3B1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:02 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6a084a34cso88282891fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085321; x=1691677321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9SGKxGE8WoMQ/68eSd1pAXEY4H4AMGjzzA6a9FWvKkU=;
 b=zOwfN48ZszaDqyrw2SvBlJDdymz0lrnHO5hyporS0BJrFVxWXGuqgfZKR8KtZ784sx
 pWiEwrxiZxO3yUMwRMc96fJ7MSPr5VbDoCLoIbXd8bbk48883lW2zEz64te28HVAUDOd
 ua3XZnqJfgQbrkG8eZMZSnrJEyf9vd7B5U7eCvdX+79mHDGZiXm5sqTXJ+gE4RV3PYRk
 IrRD9/spbkmL4Kr1K6b2/93SA0+u1VltcAwOMz/Rmxc/Lpy10ahiNul7BtcQaRdahyhS
 GfT1sPrAZlFUx8lcSP/ZuF6Bwpl3UCbcJv7g4Gz7F6JIxr4mpmBxwKgopb8WupvmCmAO
 00BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085321; x=1691677321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9SGKxGE8WoMQ/68eSd1pAXEY4H4AMGjzzA6a9FWvKkU=;
 b=Ty3b8dr4V7c4BCi/mBfKDaHKFC/Ia0pmy6LI8WEqIaeb84Z0U+dkc08gWEO2UjBuq5
 /w42nwQKfYz/6joeW4raT4CDq333e8N34C80PfNC2VlbpQDeB0y5khJ9tQMV9T3pmMhO
 hgrNHZvBz8BlWSxF51+7Jggis0AGCVIHoMulIbMFRHYHBbDzrpIBO5P40YwfKbIaBVZc
 UkJDVIA0woVO9FCdw0e58Rn7YvG0FpvOQrK9TLBRC3CkTrT58qVu5DxQTzPW1PCnueTL
 l1XzPJzqwkTZQoQJirEZM1DqrvIwDhO93GDgE1vykkFDLk/Mp0Zv54wMHHjyk7TE+x2U
 9CEA==
X-Gm-Message-State: ABy/qLaZIAdWtkLPyDwMWaKOsrs7QJ5GtChvkyUPdgL9ep79MuJM7Khi
 ZbcxeCMa5JPXGD5BYS2SiRMhcw==
X-Google-Smtp-Source: APBJJlGdbHN2h/WcztcPqGYEJLrNzJoDpArY7mIaFd7Rx6uq2AyPkHJ16rmqd2gp/s+w3xy8Qprs0A==
X-Received: by 2002:a2e:9b15:0:b0:2b1:a89a:5f2b with SMTP id
 u21-20020a2e9b15000000b002b1a89a5f2bmr13320793lji.2.1689085321165; 
 Tue, 11 Jul 2023 07:22:01 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue, 11 Jul 2023 17:21:50 +0300
Message-Id: <168908465043.1869384.3228866712722407267.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v2 00/15] drm/msm: Add SM6125 MDSS/DPU
 hardware and enable Sony Xperia 10 II panel
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lux Aliaga <they@mint.lgbt>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Tue, 27 Jun 2023 22:14:15 +0200, Marijn Suijten wrote:
> Bring up the SM6125 DPU now that all preliminary series (such as INTF
> TE) have been merged (for me to test the hardware properly), and most
> other conflicting work (barring ongoing catalog *improvements*) has made
> its way in as well or is still being discussed.
> 
> The second part of the series complements that by immediately utilizing
> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
> 
> [...]

Applied, thanks!

[05/15] dt-bindings: display/msm: dsi-controller-main: Document SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4d125651038a
[06/15] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/6321c42645b2
[07/15] dt-bindings: display/msm: Add SM6125 MDSS
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a628b5b16872
[08/15] drm/msm/dpu: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/01077e7c890f
[09/15] drm/msm/mdss: Add SM6125 support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c6da55b771de
[10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d44ddd646858
[11/15] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac2f330f92f2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
