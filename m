Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3997316A8
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D91410E4D7;
	Thu, 15 Jun 2023 11:31:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9D10E4CF
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:35 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b41e700103so12523381fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828693; x=1689420693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+ILs23VDjH7i7mI0fWXkAKxSZYuahl0zC/MkJHloGo=;
 b=oBiIi9gL+Ha0pHIzfHmW/7IOVMZlbHpTc/+wAIG44AGSF0P1uWif0rGXRZTyBssYkA
 V+WbCm9NDmllkjGF70Zn7iT9dEESwti8/ea6lOjXknjXWnlIdcdEtn1c04w/WF3wZp+O
 PrtokjcpASYKEvQpDhpEML9TfrqdorSYf/xxoIT1r0PLWLitfbl6DLMi8D0ItVExEBU/
 CtFb0kKDu7Jp+LQlpkmfXjeGAuRRXBMJAMiv1NGIj6+CwVP2iK8fUcSXYxGxevnC2fq/
 Ef17W77iU2XqYXY1mmr1bHUqxj+yu7slUFSIpIzRPP5d+W0CDnA9Zog4ShpmVf2kbcU7
 Ww9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828693; x=1689420693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+ILs23VDjH7i7mI0fWXkAKxSZYuahl0zC/MkJHloGo=;
 b=Q23CZJB6xGA3qg8IPsats8O3kQGFYfrHsV+mpmL0RQSkwOopRyMJyG0Re+wp241HMf
 6FRg6nzxou6iJJyvZ6xTasPBz4W7uY/k4G9WbYGZaXgrgIzn1Uy51fh6MIYEPrTsD0N0
 c1EiAX40CT2k4SmTmx3ymGwhuJa4dlxb/jcAmIZ/PkIhFc8KzevBybBK/hR5z2maXxR4
 HWPTzxn+kJWX1EAwOS3KElFTv+fOubRSNaIsBe8izEORecZovuY92bbTun+cIxDSR768
 X5e4r86JNNJhDgSmUpq4UH48eCZ/krI7XEPAgljvbdOGO0bTb1w9sDtR/culb0rhh1vg
 oZAQ==
X-Gm-Message-State: AC+VfDyCu/Bgwpb5J4IMrW+XEE7ER4WFQ9N3pFgN9mFv15AVIFobO3+I
 v/EsteIMyOjTNjyLf8JDDg9rcw==
X-Google-Smtp-Source: ACHHUZ4G6b++G23dV54nFY5x9tcMqhFvU20QUp8NmqaFOrwRhPMRIe/TRaOFAfk5OmkSzRvi+EYcrw==
X-Received: by 2002:a2e:91c6:0:b0:2b4:430a:83f3 with SMTP id
 u6-20020a2e91c6000000b002b4430a83f3mr1385560ljg.53.1686828693628; 
 Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Thu, 15 Jun 2023 14:31:23 +0300
Message-Id: <168682860385.384026.4498168865636345708.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Drop aux devices together with
 DP controller
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 12 Jun 2023 15:01:06 -0700, Bjorn Andersson wrote:
> Using devres to depopulate the aux bus made sure that upon a probe
> deferral the EDP panel device would be destroyed and recreated upon next
> attempt.
> 
> But the struct device which the devres is tied to is the DPUs
> (drm_dev->dev), which may be happen after the DP controller is torn
> down.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Drop aux devices together with DP controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a7bfb2ad2184

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
