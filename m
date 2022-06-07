Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453A054029A
	for <lists+freedreno@lfdr.de>; Tue,  7 Jun 2022 17:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7284610E273;
	Tue,  7 Jun 2022 15:39:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311B710E236
 for <freedreno@lists.freedesktop.org>; Tue,  7 Jun 2022 15:39:55 +0000 (UTC)
Received: by mail-qv1-xf2a.google.com with SMTP id l1so12592540qvh.1
 for <freedreno@lists.freedesktop.org>; Tue, 07 Jun 2022 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xr4dhCfuSdEr2WcWiYRbEtXrj+jlCFWCiFgRYjOI+Uc=;
 b=zR+xtsgJ7G+nQWsuYa6k/ouh729YUTTDJBzipWtz9ukuJpMGaeqMVf9/jok5oWpmvX
 YAzp0z9zSbazae95tjtxp+y4Vnlf4xBnLRh5rVDm/43851H+pwhEYwY7WURjBSmTJPm9
 tJfYt1Ehw/6luGRjwLQN98v46Py2YABHohs35P8/7A8ZFcKy9Q8pVwSXgcS6Aunbmo1H
 R5iXA6vqA9buEW5D/hpkUVfbZvayZUQV9s5dgyOEp+BtWcn/HJrrEZ0XEAD0c8y2RMdY
 F44d87V25qja1/4yPakraXZ/qTXDpvQFSNZzxxpxqPflN5Q9sCHh8m7oXvomgJQUb2vs
 45mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xr4dhCfuSdEr2WcWiYRbEtXrj+jlCFWCiFgRYjOI+Uc=;
 b=BwDzHZk1+x2bDIrA+lo88uyEQhPRVZpumx9qxZp6FK8zrFf6drZQp+ntSkxsqhLUzy
 ztwTuYUDwzvvcyw+DRP01vie1beCY9kGkXITUMERyZzDTcW4vuyvxQwoijxCCU+BATcd
 DIMG2+8sx8/V8daIPlvAoFotWOqSKeMjFYYfs20Vmn7n8i2bK57v6UZ9ELOH/81AzHES
 HJcUZMQMVKQrlk3CVY1rWMYMZ8joFYFxInbU9WgbItKcjn1mfq4tJKtQrys7mk6S2J9q
 MSiY/0+DgIK/hnSmWY4v2WOTj7440vZbn1DlXkLf6TPpm8091usqSz3WZvv/HCUEQ6ts
 Yeog==
X-Gm-Message-State: AOAM531vSF7n74gB7jSYzpJvjzBWGSR3DDFn+RkgY01kgbq1VlgvF1RV
 6wpa9ShRWGyt1docjTlvT2ImB57XMOl7KAsZPS3Rfw==
X-Google-Smtp-Source: ABdhPJy03x7T/95dDtPpCaHNjzfEcVjlYBBdheV4q9h21nNZHKPRkMbcYwtcf2LWNvzyM9zxVElpH3U8pvu3bg0PTMc=
X-Received: by 2002:a05:6214:5488:b0:46b:b272:f7d1 with SMTP id
 lg8-20020a056214548800b0046bb272f7d1mr4833597qvb.73.1654616394183; Tue, 07
 Jun 2022 08:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220607110841.53889-1-linmq006@gmail.com>
In-Reply-To: <20220607110841.53889-1-linmq006@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Jun 2022 18:39:42 +0300
Message-ID: <CAA8EJpo0f_F8kuc617UK0ovmiWvUAN+KBkViV-TPQdbt001drg@mail.gmail.com>
To: Miaoqian Lin <linmq006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp4: Fix refcount leak in
 mdp4_modeset_init_intf
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
Cc: Rob Herring <robh@kernel.org>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Heidelberg <david@ixit.cz>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Xu Wang <vulab@iscas.ac.cn>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 7 Jun 2022 at 14:08, Miaoqian Lin <linmq006@gmail.com> wrote:
>
> of_graph_get_remote_node() returns remote device node pointer with
> refcount incremented, we should use of_node_put() on it
> when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
>
> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>



-- 
With best wishes
Dmitry
