Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D618267D4EC
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 20:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77DFB10E98C;
	Thu, 26 Jan 2023 19:01:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816A10E97C
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 19:01:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id me3so7673909ejb.7
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 11:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
 b=WGevx/naL4qZvFBxjyn8EVDeyhoS8GFaHGqSzNiRyzh8H+wwaiEt2T1Knvuukbznnu
 /JtnoXHCXcEIbk/Q08aurrA7RiDMlZFb5BJ+f/DdQzXuxRRhlVvQSgjqpHStyMaYWw99
 qaQq65HxxNkimIkzxCccMJlBqsbGbW+nD1tBI277Yfk0nvswBsyIbuf+6qeoyCtISGCI
 zr1PV0bSG8MZIF4t6ZGmAdGadEYxXWnLiy5aEy+x8aWw9Bt2g/tIWigdPS1RtQneeJHM
 ox3OUu5JP83GPBniO/umA+GsTd5gWijoIwzSZE75omgxtBfmHP3+R45R9t1ih+cmtfey
 KBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pIp/tztbC7zmUXL7EUgPj3UhCBeJNUNuWUzm8HG2JLM=;
 b=diIIok6DE9Rak1e/EZ6zq9xF+pe2PvtR4KbtLWcjWeWlXSF3NVp1EmzS2lohQcQqbM
 D8B6+ARXxBnZZDZWpsxrxa0gP+e3A/89ytDedsseiH7WdzOegiY78VliJr00j/Z4JO/n
 HcyPKeCl2/zsbHgSTnu+5Y83tY0DlLGXDKVVYXBi26aCuTxvrO7i1ReZqpw8oDyvZccA
 CYgdghyLAQUalG2g50z580QHB9CWbqMqcRlvvJx2Ddow/Mkcl1kwWME1tL3K6FPoX8GE
 xgSEbmh188YkXqIfhalDT1gCVwOQBGnRnbI5r61rtK2qJvnJZnY4E7y9qtb/pAtYblg/
 hB4Q==
X-Gm-Message-State: AFqh2koBiu6ePoLVrWT0CwnWmwb+/SxkLCM1ojsy5cb84C6i1SKFN6bb
 LAnFY/65sf32Io7O+DsZgCUZrg==
X-Google-Smtp-Source: AMrXdXthSV4ZVP7kF+MIrvM6zfMVfLR27somX+F5tm/T53zRfb66OKxF8SNTTuz2rRuzCKJbenQCVA==
X-Received: by 2002:a17:907:d089:b0:7ad:aed7:a5da with SMTP id
 vc9-20020a170907d08900b007adaed7a5damr42286398ejc.28.1674759669094; 
 Thu, 26 Jan 2023 11:01:09 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709061b1900b0084d4e9a13cbsm974982ejg.221.2023.01.26.11.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 11:01:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 26 Jan 2023 21:00:53 +0200
Message-Id: <167475959085.3954305.638885945144543284.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 0/3] drm/msm/dpu: several fixes for UBWC
 setup
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


On Wed, 07 Dec 2022 16:28:30 +0200, Dmitry Baryshkov wrote:
> Several small corrections for the UBWC setup and related data.
> 
> Dmitry Baryshkov (3):
>   drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
>   drm/msm/dpu: correct the UBWC version on sm6115
>   drm/msm/dpu: add missing ubwc_swizzle setting to catalog
> 
> [...]

Applied, thanks!

[1/3] drm/msm/dpu: handle UBWC 1.0 in dpu_hw_sspp_setup_format
      https://gitlab.freedesktop.org/lumag/msm/-/commit/975b86f8c2a8
[2/3] drm/msm/dpu: correct the UBWC version on sm6115
      https://gitlab.freedesktop.org/lumag/msm/-/commit/7a9898ec3018

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
