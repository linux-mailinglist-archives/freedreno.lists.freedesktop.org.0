Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0BE579225
	for <lists+freedreno@lfdr.de>; Tue, 19 Jul 2022 06:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD3514A072;
	Tue, 19 Jul 2022 04:48:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D1F14A077
 for <freedreno@lists.freedesktop.org>; Tue, 19 Jul 2022 04:48:15 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so29292793fac.9
 for <freedreno@lists.freedesktop.org>; Mon, 18 Jul 2022 21:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aJymfMTLF3V7ElX+b3QpJ+uAT3GT/5Q9yr/dFcNEhs=;
 b=vaKuG49TyhspbeY60kzZ6Im+k6xB5DEp9boY/8u3C6+YuM7Quo8zoXp0IiwwvMtxmU
 VXCgRWsb+lwpQfoVDwiQ73gnlkKo6WC8W8VA65guUg3D55tCqB1GYsGHeKLOcbCEzaB/
 BUc5PWm7ORAlDOM97jtyT+CLKNfmbAkWOKmtZjsrmCvJSFh+SwBWtIrzu+bgpjaBIEk/
 SfLonku3BdT8K0+nGwDZsiM5PjLpDVGPDNpl/vEFoKwVbpzvaxrG66Hl5ka1AiQ9AzdY
 tOqjKEuMcYMNPe6GuVWzOvL5/4I9Wy408AJFMpDsWdJONSblT0RJ/KrrT+DnJyuFWKRl
 XQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aJymfMTLF3V7ElX+b3QpJ+uAT3GT/5Q9yr/dFcNEhs=;
 b=jK+kuDoSxT93F++fLry2FqmXfFR534mCHHbRe3D4hHaPoGG46yWMR2ZpLPr6ZE61sC
 x/yxl/fLdjFyZiIC2BwMHsPS7FucBrOvB19SUAEwSHSOEq/zzHJ9pKzbgT4ty0NO2kIm
 I/XISAirKOveWdhqE73rxFfo4ZZyvoAgp+eWfXRNEXMp5HfuFmLf2+Y2mZf1O9NqhrM8
 4oJ5lYJCfGm3s+CsthNb3Z8SgUmlMP4E/WVc4PBG4exLiU0wF+SldZqejQWLoaSgpDhG
 WSFrNMFmyf4toYSUsQrQ7rnPEzeXjKg1ihI58TE4wSS27wZlspbzAxbJgj6HxZMUVeCv
 ELkg==
X-Gm-Message-State: AJIora8RKQDBo4dPEQoRKwzjcWBkkK4gK/Cwkv8pvet0zuSFoVpYIVMh
 JxGxqd5Bk0ZvJikL5l8qwcZdEw==
X-Google-Smtp-Source: AGRyM1u+ErfCuSHr5Erivc76AfPeU0LhRvfrJ7R7I2Ve4TYxaQ8gthTJr0jwPUUBpxCskBCB6aUsaA==
X-Received: by 2002:aca:1803:0:b0:337:e764:9927 with SMTP id
 h3-20020aca1803000000b00337e7649927mr14949031oih.51.1658206094780; 
 Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 w9-20020a9d70c9000000b0061c9bbac1f9sm2803209otj.16.2022.07.18.21.48.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 21:48:14 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: robh+dt@kernel.org, robdclark@gmail.com, quic_khsieh@quicinc.com,
 sean@poorly.run, vkoul@kernel.org, swboyd@chromium.org, agross@kernel.org,
 devicetree@vger.kernel.org, dianders@chromium.org
Date: Mon, 18 Jul 2022 23:48:02 -0500
Message-Id: <165820608074.1955453.1557807402050131416.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH v2] arm64: dta: qcom: sc7280:
 delete vdda-1p2 and vdda-0p9 from both dp and edp
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

On Mon, 11 Jul 2022 09:23:23 -0700, Kuogee Hsieh wrote:
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
> 
> 

Applied, thanks!

[1/1] arm64: dta: qcom: sc7280: delete vdda-1p2 and vdda-0p9 from both dp and edp
      commit: 8ed85d1e515ff5f302a929308c7ccc06bec68632

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
