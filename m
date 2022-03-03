Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF744CC909
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AB10E367;
	Thu,  3 Mar 2022 22:32:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5C410E362
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:32:44 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 g6-20020a9d6486000000b005acf9a0b644so5854544otl.12
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
 b=GbaSq7Sco4VRA/oh0xEl8QWO6Ytp28GTZ8m3hxiEvIN/2JlsRqI6+keQBbF8189DgD
 xGy+QATLDYi4YFxo42Kpb4SUZ3GN0gX3bVhC1qbvLNF+RBC26Y/Ffs6iDBAOc3Qg8D8i
 wWz2xqZCr+o2pu0pAOA8yepl8YzncN0/PrADs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=V81iJtyobtEfcvtMkpIA2e+dDXWgImsI9k96/3JHfPU=;
 b=7mp+K/hkoktnJv57QM70YPo98r3OIQOdvRvNX8Nzu24J+anpnznr1rf8FAidjp4evz
 auxHhbqaOt64gvve5T6iy/XjnukReO02QX6TgjZY5JdTI6XJkUcGCWDSmczLI+QGtKyP
 fa4WKnZCgZRk1LGqeT98jaQrnyrzCpyb2G3hsbcArN6Jwh3dqUSA53XgBQvwWbnknloW
 KlGbzDBsa0unnjp24RctACQr2b0uUszV9VKRxEnVO2NSW8Y2fgBYXQW7N1VqMTeZj0SK
 lbk2rWaIm9nxiZTirid2TA1+eKZd/J1xmvNwkuV0rtOTCunTXucPE3af1qjvulqgYeHS
 rCrQ==
X-Gm-Message-State: AOAM530ihi653Y/QOrNMmV2/ZYqfWyGZrEjvhxzAmp6/i4vncw3Nh4IU
 remgJRxctNuT+L5aYvm97ErKopczqIAp8fzM64k99A==
X-Google-Smtp-Source: ABdhPJzCsxybXW8deEcr9YdSM+FzB0T9BmHhm0B2lqcjqF/EbQQDy/dHZ8QPTz2FpMjry8F/Y2/GdGbvlKYpn+FbRik=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr20728475otl.77.1646346764025; Thu, 03
 Mar 2022 14:32:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:32:43 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:32:43 -0800
Message-ID: <CAE-0n50bntVXJ_Z7hNbuCUchP68eLa1X0tMxkVtwpKVsTnQyvw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 4/5] drm/msm/dp: inline
 dp_power_clk_set_rate()
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-16 21:55:28)
> Inline the dp_power_clk_set_rate() function, replacing it with the call
> to msm_dss_enable_clk().
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
