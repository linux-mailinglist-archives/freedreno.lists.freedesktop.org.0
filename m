Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BDE50BCA1
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 18:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADBC10E38F;
	Fri, 22 Apr 2022 16:10:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C4510E28D
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 16:10:54 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id u15so17244341ejf.11
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 09:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
 b=oY3R9eMENeA4yFgfxxAh0CIL63NfU/4cQZy0VBfnWqdkaQCrjP1OSsrzairEuqTc8h
 dCnx5NBV16wwOh8IExGkxkRthS5yV1+uEB61rOzpqQGfyzUlUPRRrILpKog4hvbptgGe
 HyH8ZzQX9V8+aRsclZdqqy2LK9aUqTNtjPWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TO6k5Eg+5Nqe4CCIAN4ROGKgZysMxXNX64mWMEm2504=;
 b=qYciORYefRZ6ue1kSRsNlSrGu4E3OB1727S+Fb75GrNErMRecU2iVH+z4Z5ECLQiF0
 Z0pw3oDbnBroyMDgyHV8FvBZ26PUrmVIgk+R6HCANmrw9bwqici9nUY/klAQ1T9IqWT1
 m0X4ee6ljxIjgEo7PZ0FzEpLtF3ZULtyoPS42wpSgpKCfzIZRnMP9xrxlq+A3jN/qCQV
 eWqTDm1xlzDtlY+zRQL+gyPZR1QXjWg4otMC4Syx5x4/itt/n0LKTk6iNctR+j8jCJU2
 rZNcsIZbG351/l6exUFCmTrLUExiS049wniXdXG/sRXCUUbwK+AhqmRqsTm0OvG9KWxq
 DXCw==
X-Gm-Message-State: AOAM5314Xv6jyMrB1EJqJeGzZj0+RZ2npkh1O45ytigxMhIQeWid5WY3
 lsbxR9ed0DRrM8T05HhFpYiQyJ4PExqtBpb8QHw=
X-Google-Smtp-Source: ABdhPJxxhVWTtWpOmmFJlKhhvGXtYhzqoYyEiR+7CgcASJgbmMVQR0q8iVw5qnxpCRrRfwB3aAsV/A==
X-Received: by 2002:a17:907:7b89:b0:6ef:f8e3:dff3 with SMTP id
 ne9-20020a1709077b8900b006eff8e3dff3mr4598521ejc.597.1650643852826; 
 Fri, 22 Apr 2022 09:10:52 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 wc23-20020a170907125700b006efa5c8ba7esm861127ejb.116.2022.04.22.09.10.51
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 09:10:52 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id t6so8312579wra.4
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 09:10:51 -0700 (PDT)
X-Received: by 2002:adf:a29c:0:b0:20a:a246:a826 with SMTP id
 s28-20020adfa29c000000b0020aa246a826mr4418755wra.422.1650643850709; Fri, 22
 Apr 2022 09:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <1650618666-15342-1-git-send-email-quic_sbillaka@quicinc.com>
 <1650618666-15342-3-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=WWa8n0MJB8ks7bgrSj1Qop1Z5hvfEAOWtFcmsz38eR_w@mail.gmail.com>
 <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
In-Reply-To: <83129bad-44a9-bec7-f931-8067ef1b9d4d@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Apr 2022 09:10:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
Message-ID: <CAD=FV=Vu_0vxb_D+8n3qhNZ66nRXBp5vxshChmOM-ToPJxk=aA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 2/4] drm/msm/dp: Support only IRQ_HPD and
 REPLUG interrupts for eDP
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 22, 2022 at 9:05 AM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Doug
>
> For the lockdep error, the splat looks similar to what kuogee fixed
> recently.
>
> Can you please check if below patch is present in your tree?
>
> https://patchwork.freedesktop.org/patch/481396/

Indeed I did have that in my tree already, but the lockdep splat is
still there. I think the problem is that we're now calling
dp_hpd_plug_handle() directly in dp_bridge_enable()

-Doug
