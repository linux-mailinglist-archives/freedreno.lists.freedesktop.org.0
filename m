Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93363487146
	for <lists+freedreno@lfdr.de>; Fri,  7 Jan 2022 04:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AC610FA68;
	Fri,  7 Jan 2022 03:37:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1F710FA62
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jan 2022 03:37:02 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 j97-20020a9d17ea000000b0059069215e85so5254861otj.13
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jan 2022 19:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
 b=gSpK8J4n7dxUsqwALzCNvN8wJ70GBoGsNjlrkbbYhD6WU2pNysbn/qal1NnPO+NrFM
 dj8t9ARs4nKO0fUdROf18x6bcu2KIZdRw/sU8s2RfNKQ8xpYwtJtmpSEuRvmrD4yTf8x
 O9P2bBGAeDrkzbCwSyidZj3iKWyTSeh2rjVcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=V9mvsC6DGuIKmVWqSZ8Hh/LgnzR2ZGlGS22EsE3aa5c=;
 b=oyi2K2gcfwVPerPOuBdotYbMkGw+1yt01wG8Sl42WggoKAgAxcWJmuLR+F6CME+gyT
 Iu+rB+9Wm+LGUd53a3e4waJqKbYuuKAyd2v2YgbbMLt6ornYK9diLl1vJzgz/LpDwxZd
 rbX2pj5V00gRUIk+C6G7XsHMrrn6f2qFtu8ezzD7FbmOW2wy9oftrQ422ebtlU+9/WXw
 mbk38yBgNw81qZzkAhIlBwg14A/P9kTwEpPP3gvdxb55BjBWtzLz741ZTx5Dxy9illOP
 qWSdn0wctXVRt1m9yt7BwRLcbbHXqfXJBa+9WE53sF7op2QqNqMf6GRERgYYBLXgNyUa
 MoAg==
X-Gm-Message-State: AOAM5310mMOU/aoj9g2Cexd7b1Pa+5AuBC7fRVMAHLbOZi7Om/zQ2WnW
 IoJ/RZUYUCAzTPboPg1jSh/v6Reu9jDw15spw/wnxA==
X-Google-Smtp-Source: ABdhPJyU0TGUnomL9oIu+YtgauKLIsxl0/No+gbVlEzQt9cSRx7b2g8hXaUYCjWvRTpSAEFsVO2YQWTDsqh0nBzcZyY=
X-Received: by 2002:a9d:7451:: with SMTP id p17mr1037416otk.159.1641526621309; 
 Thu, 06 Jan 2022 19:37:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Jan 2022 19:37:00 -0800
MIME-Version: 1.0
In-Reply-To: <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 6 Jan 2022 19:37:00 -0800
Message-ID: <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/7] drm/msm/dp: fix panel bridge
 attachment
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

Quoting Dmitry Baryshkov (2022-01-06 18:01:26)
> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> enable and disable") the DP driver received a drm_bridge instance, which
> is always attached to the encoder as a root bridge. However it conflicts
> with the panel_bridge support for eDP panels.

Can you elaborate here? How does it conflict? Could be as simple as "it
attaches before the panel bridge can attach to the root" or something
like that.

> Change panel_bridge
> attachment to come after dp_bridge attachment.
>
