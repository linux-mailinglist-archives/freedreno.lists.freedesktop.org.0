Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 528014B7CF9
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 02:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7ED610E5EF;
	Wed, 16 Feb 2022 01:58:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877F10E5EA
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 01:58:16 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id x193so1047199oix.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
 b=Gnq6jup1l6drogXm5zLIW7T4+UgswiqhIR3xlYF0j4UoHds31D2nKD2iK/rNbQWLs+
 VMtu3Whx3R3PQFSy8kiwNe4oKUR6dYnbXMewIueKhaPmQWYTjvNQVwqbzpKskAseBzij
 uu1rcEj64gkWdlmyr3K8YZGkJ+oXJ8WUZbvOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=IcgOPc0rJp8sHtsVDdpyt4dUu2ENA7U3FqQVPYdmEn0=;
 b=527buGqmDVaGqcktgdJVuVeEqH/+fzVOshisRaZInKM3mC/FEWEpiECYVIf2RbRIyd
 rTAleSWPIIjyFKpi94K7zTQQKJg+aB4dY3dnF29stkQESKrXjwvM3FWIyZOh/xlhUYnH
 o3TKYPetim6TOYwnhbrmIBSZbvzfZ9NDgHTnNaWGBMvDD9DKmUvTNUUs9rc4hbzIRX5/
 nokzdOVEezZHT4Ud/T2CaLACSR7ZufGxMTpe0b7mAN9pU3pdDrcBWEArB0r+7MeyFGWu
 YfKxZD1SyRWCx8C/DVHM3xHLoqw6HR5tJIQZlnhQe/dSw0lCvnOv+lTGPOFVjjs8H2Q3
 e7mw==
X-Gm-Message-State: AOAM533gOtQW75Kt8HiTX6dvyntl4JhyYCTL3ke+KvB7sM+Rh2frPTtr
 f7rAs/TvVzSDUbE9G0+C50i04FJOX1kH0E0RWGDc4A==
X-Google-Smtp-Source: ABdhPJxcoqJNO+Lsx3UUyC+cNI2rE61Ob18NoOX/UKotu6xvKZnjc0qxwowSFVTdTsRRILeuqwVIjl3tDr7oVqHqtyU=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr2950770oig.40.1644976695886; Tue, 15
 Feb 2022 17:58:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 17:58:15 -0800
MIME-Version: 1.0
In-Reply-To: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 17:58:15 -0800
Message-ID: <CAE-0n53VOf=X9-81TUJ_xWVNmz+RPsURXWNBhXLpPpHKZbMnOg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused
 mode_fixup callback
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

Quoting Dmitry Baryshkov (2022-02-15 06:16:40)
> Both cmd and vid backends provide useless mode_fixup() callback. Drop
> it.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
