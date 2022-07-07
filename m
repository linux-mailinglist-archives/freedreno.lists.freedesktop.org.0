Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C39569805
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 04:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E9710F2B8;
	Thu,  7 Jul 2022 02:31:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC0110F2E7
 for <freedreno@lists.freedesktop.org>; Thu,  7 Jul 2022 02:31:39 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id r82so21994543oig.2
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 19:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1ch/3x2mGssm8qBEpggkAFFiBWCJh9rWPZpVFB+JcTU=;
 b=vRJyAYL0VzceK0mW/2KKFNzbEbpWd/O5CdknxxDR+koJ42kwAdu8uK6uUSNk0RtczI
 vI00ieUmNlrZXPjIYS0E6Lv0A0JggxlqwFPaRP9Z3EojQhWuFKhcU9cO31dth9ZaXfAV
 e2Mj3rzD2SRZt04IHEMQQ9VB8DlhiVEWkzeivjICGx4Tq92mDWauW+Z60F2L13mIgBf5
 fCZhhdrI7yqfzI4/ve9NkqlkVPmd5XV6o5PHNH70PcHGChvogBwZJpTejB8ZJEPvIDRY
 iMtV4qJEV2pjhAYHamFOToWKSl1qKI95YdWtFrwVkq9kRLJhpTKrhkGP+XRSqmgmJ+Fz
 uF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1ch/3x2mGssm8qBEpggkAFFiBWCJh9rWPZpVFB+JcTU=;
 b=eHZ7MEvM5RyrKSuI0Bp4jMvvpO7aEzYQ3RxhdAzTTsxJrJRa9ga2DzwwcVEqSJsc5E
 /WNmxVVxpB0Qn5Q1D+VIZtIMJvABrLEN7kgxcnQDQdaJCAEC9jFjpEOJ03E2lId1rYVa
 yDrBMOK1cvsFKEsAU3GA4U5P4LgbdvCYtQBopK4L9/woRy+fRiVclEGWL2V5xr2A+x/9
 ZXEkZyeT29zlyvPq94uo48QKmUGJpW3L89qwnW1rLUpq7Sj44xkFI/Ym/TV3PywXNior
 +qdzRo+2J221pOA8D9TeV45CTT86ls3JFEOABKxk++3zzgk5DUq8PLfslVjHNyZlS8xQ
 hw0A==
X-Gm-Message-State: AJIora9RIRTe61w6tw0Pqe9oTGVG36GjNGQUXpY5wLmKRRTFq98CPL46
 HCKdVnAcGEeLe/stERVHcj2+JQ==
X-Google-Smtp-Source: AGRyM1uHq9ZHuymbi/mIRAGAFY8gONPHVHl0zZUZjWFV6tqb5bWY5UZFoNFjqtdtsMVJnMl7tnlD4A==
X-Received: by 2002:a05:6808:1719:b0:335:216e:dc01 with SMTP id
 bc25-20020a056808171900b00335216edc01mr1104566oib.275.1657161098927; 
 Wed, 06 Jul 2022 19:31:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 x48-20020a056830247000b006168c71ca4asm17024469otr.56.2022.07.06.19.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 19:31:38 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: vkoul@kernel.org, robh+dt@kernel.org, sean@poorly.run, agross@kernel.org,
 dianders@chromium.org, devicetree@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 swboyd@chromium.org
Date: Wed,  6 Jul 2022 21:31:16 -0500
Message-Id: <165716107315.864223.1202817730153711160.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH] arm64: dta: qcom: sc7180: delete
 vdda-1p2 and vdda-0p9 from mdss_dp
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_mkrishn@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, quic_kalyant@quicinc.coml
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 1 Jul 2022 08:47:16 -0700, Kuogee Hsieh wrote:
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
> 
> 

Applied, thanks!

[1/1] arm64: dta: qcom: sc7180: delete vdda-1p2 and vdda-0p9 from mdss_dp
      commit: 154fd146a446c0fffa81d72c78611b0ce26b2718

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
