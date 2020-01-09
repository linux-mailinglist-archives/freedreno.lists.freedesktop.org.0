Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5D2136384
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2020 23:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CEB6E976;
	Thu,  9 Jan 2020 22:58:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7026E976
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2020 22:58:35 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id y184so60714vkc.11
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2020 14:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
 b=Vs4XiohJHiCv9DpKDaL8PP0Cv5qmD17Ku6z6gwXdTevogicvgzz0V56LTDKUUfNPhW
 Iwx3uHBuDesHk/r2q0/LgARjOLEqx4IOpy0IKZ97asjGTuxOtDPF+Jub17jyVKigXjQ0
 hlfVpIYGC1LZrXImn2ixRg2dQuyHeSCEDqyhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3Ic+/+tOQj2Lu5zb82dqbL3LnFvo8VU2lGIIpV77vw=;
 b=CYCGZ8IRFaXdboFqKpLDShZGdI/Gl8T3kQX+1Q2LPoBBhNrO7iwTAL/SHFCKnjR2fB
 q4HOdYRh3pSpJsC62FVGv+YdSB1fXegm9d0KQ07ms2oMBr2CXLPYk3+lJ9MRnP4SLTtr
 QD/s82OyzJVcZsHLFIEXENN8eRKznxZ+nn6qOTV69n5Zwbgh6wcUTYH4aAvpkh65vLPe
 a3Rr8VwASY9H2QUPAHxnwaBlIT3lCwMbN62M/CIPHlaIBd+yre85qviy65sm+0wJ14Ps
 coGPuWnruvb6TNYd+TpfsGxjKrhyuheciJvhtuod3iNYvdckjaXasFpRTP11EGBOp5zn
 Kybg==
X-Gm-Message-State: APjAAAWaQZIV/e7YiPyqJJtH65lC+bvJiw4gWSklpM6UA0WFDYy/oBva
 to+KlMKZa3O5KA3FKcVbxDIYwNS/pqU=
X-Google-Smtp-Source: APXvYqyHRKEYWo5ZLFv3vigHvSo9A1wDdpQbiBNvj36k6Ab/QevygrDtai2fWlAVCbGUXjz8Dh2uQA==
X-Received: by 2002:a1f:e784:: with SMTP id e126mr1701vkh.102.1578610714174;
 Thu, 09 Jan 2020 14:58:34 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id r15sm97706vsa.30.2020.01.09.14.58.32
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2020 14:58:33 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id t12so78740vso.13
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2020 14:58:32 -0800 (PST)
X-Received: by 2002:a67:e342:: with SMTP id s2mr50831vsm.198.1578610712346;
 Thu, 09 Jan 2020 14:58:32 -0800 (PST)
MIME-Version: 1.0
References: <1578396597-18324-1-git-send-email-harigovi@codeaurora.org>
 <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1578396597-18324-3-git-send-email-harigovi@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 9 Jan 2020 14:58:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
Message-ID: <CAD=FV=XwkvGgJUeNs=aKoirSw_f47QoDTuvQF25VE7ychwdJTQ@mail.gmail.com>
To: Harigovindan P <harigovi@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/panel: add support for rm69299
 visionox panel driver
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 7, 2020 at 3:30 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> +       drm_panel_init(&ctx->panel);
> +       ctx->panel.dev = device;
> +       ctx->panel.funcs = &visionox_rm69299_drm_funcs;

I haven't reviewed your whole panel driver, but I did just try to
compile it and found that it won't compile against mainline.  Namely
this needs to be changed to:

drm_panel_init(&ctx->panel, dev, &visionox_rm69299_drm_funcs,
       DRM_MODE_CONNECTOR_DSI);

...because of commit 6dbe0c4b0fc0 ("drm/panel: Initialise panel dev
and funcs through drm_panel_init()") and commit 9a2654c0f62a
("drm/panel: Add and fill drm_panel type field")

-Doug
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
