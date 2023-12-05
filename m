Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48568044F9
	for <lists+freedreno@lfdr.de>; Tue,  5 Dec 2023 03:34:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6716F10E46F;
	Tue,  5 Dec 2023 02:34:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E318610E46C
 for <freedreno@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:10 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9ee6fed3eso39603761fa.0
 for <freedreno@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743649; x=1702348449; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
 b=AHok73nVneLWhGOHYpLkXZHAH3f5+nxtxkAa7+oYVdnLDpGIlblBd4PfHI2xJueEtb
 GUfXEExlsghIVUed8Z2hyNgJWPQ7CM3edNmKrnAOZJ/TYTJQU0Ox6F4epuj7U2sCQP89
 LQRZdTqZvezd593KjsgsjsjiLFz0w57tuPwPDb6n90WDSzVCM+15GM9eB+GcThijZtN3
 GeVTFbZ2oJznCQMdAgoOyyz+DLIsD2jAMpFcoqVhV0pD6Nh8hT4kpiB/pTMoP72KbzfG
 TrpfH0nKvlnSDv7wpQbRuWY2dLjYImHGTvQwwr12L7UZUCxGuFCnVupumiT58+oY9kt8
 +agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743649; x=1702348449;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpaMsJ+mJnMBHitD97cG3Tu8qBw0lnksRrucuKZ12i8=;
 b=jBzihbSjv9/E8SOhpNsRWtYrCdNsPXUsWF+y4FcGn/O8GPAVpOroHbP2VDU0ZajWSE
 jWJUTDTUzReAa4dY1wRDUORM7rgRRiosKBaIQCqodpngAcN2l9c2uM5Wy/GRiJ3MExN8
 IA0c1+4F9YoHSoeKm8fzC7dE1JKHjd9YGxg6qqLFTk4ZlavZcInosE3EA/TNZimMXHd+
 jz9Ui00RZyjUy1RNCiucJnpK40YyPrseQBwUfKIMasVC1X8YT10nKFVY3naqr1B3TAI9
 uIG5mxHzZJ9jdzs3yzZK9Sb9X7iS3lEZzPlxkMpTaw7LhNXZEnCEkP3bH4wXoXlgWeld
 JBCA==
X-Gm-Message-State: AOJu0YxQY1DW3K3e/uovtVwGbY8Y7mFHvT9gO0HRJPMKIgHvSW4uw3mh
 xWJuU7DvPmG18JQ35VIJivxq2w==
X-Google-Smtp-Source: AGHT+IG67aMeKoeDw3yoE/uU1x+gMjg4dCzQH2MkY+v8uyNXuNXe+gI3Tpdid7xpUI5eboGQBS4Uew==
X-Received: by 2002:ac2:46d1:0:b0:50b:e1ea:b61c with SMTP id
 p17-20020ac246d1000000b0050be1eab61cmr2454905lfo.49.1701743649146; 
 Mon, 04 Dec 2023 18:34:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Ryan McCann <quic_rmccann@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Liu Shixin <liushixin2@huawei.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Richard Acayan <mailingradian@gmail.com>
Date: Tue,  5 Dec 2023 05:34:05 +0300
Message-Id: <170174354266.1582017.6964573131829397385.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231017021805.1083350-9-mailingradian@gmail.com>
References: <20231017021805.1083350-9-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v4 0/6] SDM670 display subsystem support
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


On Mon, 16 Oct 2023 22:18:07 -0400, Richard Acayan wrote:
> Changes since v3 (20231009233337.485054-8-mailingradian@gmail.com):
>  - move status properties down (review tag retained) (6/6)
>  - accumulate review tag (3/6)
> 
> Changes since v2 (20231003012119.857198-9-mailingradian@gmail.com):
>  - rebase on series and reference generic sblk definitions (5/6)
>  - add interconnects properties in example (3/6)
>  - remove phy-names properties from dtsi (6/6)
>  - accumulate review tags (4/6, 6/6)
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display/msm: dsi-controller-main: add SDM670 compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bf5a80695311
[2/6] dt-bindings: display/msm: sdm845-dpu: Describe SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0e1af3ec823b
[3/6] dt-bindings: display: msm: Add SDM670 MDSS
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c965007970ed
[4/6] drm/msm: mdss: add support for SDM670
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3c13a56e4353
[5/6] drm/msm/dpu: Add hw revision 4.1 (SDM670)
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e140b7e496b7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
