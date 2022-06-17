Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BF654FE8E
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3010E443;
	Fri, 17 Jun 2022 20:55:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1CA10E443
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:55:02 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 q1-20020a056830018100b0060c2bfb668eso3928619ota.8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
 b=J/KAuPGEsivDv33XuIq2xTcMGgDRqhWxAoD+Tzk+nDWGl9jDGTOWTx0nunPwD4byDk
 FaeETdidas6GwYYNf1qBFXlMcUPvUXBOHATyBbGzeOHRWh76uVa1SqUK1Kll7jRZIw75
 m1oOrl/2PfMWsQC460Gdx9AksE90kx/JDqn1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=liQN5qtUNa2mM5mknDTOFWHHb8rU09mHks8H0tyK+vE=;
 b=4Ny2bAOI1qMqA9qCgTFswnwN8QUomy+B7zOG82VP7iPZOjj5IDdxTuvrSEpY+7e9+K
 s2QgLFVee+fD8/Y+JQsENPXDjtzEe/5QihGNv0+OUVCg8L1Nm7pwjAa2ODzzIIHDcwn1
 b6wnsEN1r+oig+6rgNzwhQfuPJLV0f0udodepHtJAX32/4giAi51QZo3M87Agi4MQ3ss
 6p6v1hy6Uz0kn4DCaMRrWaLDKLokLCSjyHwD7gFllvzvnTeyu/2xsWWYDwwAGyn6pCTD
 1GpVE+XMllqi2N0LrsRjhYIY51MUSK0G7xw8rfHk51FnIFhr9uN69+tr1oiXIh1AGaGx
 Pa3Q==
X-Gm-Message-State: AJIora/uIYuKl6eC6DJ9v5FUf6KKyQstcEySU9HdGrTXx22OM7cDanMm
 rJfFXyOz0KyGFNBhLSFHogDefNW8rI0CgisF9HiXKw==
X-Google-Smtp-Source: AGRyM1vP9nApPqYwQndj8FDnlRLdyc8637CAsZQ8w99xEFsa/MBvPzT9PmZCzFl4LEkTZBvNBWJiuG/QFQco0VTetAk=
X-Received: by 2002:a9d:729b:0:b0:60c:21bd:97c0 with SMTP id
 t27-20020a9d729b000000b0060c21bd97c0mr4957121otj.77.1655499301490; Fri, 17
 Jun 2022 13:55:01 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Jun 2022 13:55:01 -0700
MIME-Version: 1.0
In-Reply-To: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
References: <20220616085057.432353-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 17 Jun 2022 13:55:01 -0700
Message-ID: <CAE-0n50Mrq=iwoEx60uyv7CKXWYJkjMZPgYtNnmfpKka_y3y5w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: support attaching the "next"
 bridge
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-16 01:50:57)
> There might be a chain of bridges attached to the HDMI node
> (including but not limited to the display-connector bridge). Add support
> for attaching them right to the HDMI bridge chain.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
