Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A2A7316AA
	for <lists+freedreno@lfdr.de>; Thu, 15 Jun 2023 13:31:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4EA10E4E0;
	Thu, 15 Jun 2023 11:31:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4283A10E4D1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 11:31:36 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b4491aaf4dso3478241fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686828694; x=1689420694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
 b=sWl8F2voBm4VFmhjOWk3Mvd56o9Q17pdEJv9OKmu6DX08C6AS4MlgML5SOfnv5fslC
 7qBZLjuUoIcOK9sSmwXsrygAORrMS4cr3gu6pxGmgED0Kf8eHW7QcCq6rkwN37PK0Qwi
 zmsQ40C4cNbcpmG44qwL8dILcT7HcqKRzcar6OU06XF3Mx9mMl1IA9floUpsxfa/Ba58
 yurRT51NVJOdVWVNUGIF7BzTv2+omNx+KlcDhPGSzDiHxOJz8M8GQgXVcD1dUxmAv0Ev
 cayZCZRY9fpfTyHgQbQzTeDYGNGXWiri7gr74KSNPDQaBD/difN/txZvGbWCawRXwur5
 Q1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686828694; x=1689420694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bQYiwI0riRd5ZPD263zPLo8B1Ez60Z4MDCuH7wIBjQ=;
 b=S63sHRjXfaan688g/9r/z7W80/Ui31Rvjl9FbIGIMmXLw3Um56vi4u3vkzugz+PyY/
 cxGvWmWJD49s8jnKq+pKIAu3RWktFr4JWxionHc8dLVlO9m885xmYk1qehJ7zQF6WZMr
 MHubRFmQzFBzgoXmVZbwuvmj0CeyS5+XRzdwhWGU7RS46EYh8LKPx/bxBtp3cwj9L5UD
 +xJQUbb58u67uJQrNOJ171IlY66X+Q6LcLfjcyPCO8KekhdBX4jNu/tOXGP5O4UgwqLP
 F+lG6tL9wt/vpecw1j1SPBABW8KazpUrMd/VnwQKERPCpM4b//qmX7eWSqHAht26OQSM
 o3Rw==
X-Gm-Message-State: AC+VfDwB0GAT6ZRk/quKrf+1eEFdELcKUOaO1juldqAVK67c99pvJNFa
 +LrmlvIosDIxn7bhpjQh9WIndw==
X-Google-Smtp-Source: ACHHUZ5BGFBfj8nOlWec9YJ6ShqiniydUBQo2/Y5PM4Qt962d9gXvqSB8hbe2V3q7OxfNlIF5NHy4Q==
X-Received: by 2002:a2e:9f16:0:b0:2af:32a7:4eef with SMTP id
 u22-20020a2e9f16000000b002af32a74eefmr7484463ljk.35.1686828694598; 
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 y12-20020a2e320c000000b002b345f71039sm860525ljy.36.2023.06.15.04.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 04:31:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Date: Thu, 15 Jun 2023 14:31:24 +0300
Message-Id: <168682860385.384026.4276167891794745473.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
References: <20230612220259.1884381-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Free resources after
 unregistering them
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 12 Jun 2023 15:02:59 -0700, Bjorn Andersson wrote:
> The DP component's unbind operation walks through the submodules to
> unregister and clean things up. But if the unbind happens because the DP
> controller itself is being removed, all the memory for those submodules
> has just been freed.
> 
> Change the order of these operations to avoid the many use-after-free
> that otherwise happens in this code path.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: Free resources after unregistering them
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fa0048a4b1fa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
