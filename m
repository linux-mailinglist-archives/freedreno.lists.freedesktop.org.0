Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF0F4761C0
	for <lists+freedreno@lfdr.de>; Wed, 15 Dec 2021 20:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205B610F87A;
	Wed, 15 Dec 2021 19:32:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39DB10F879
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 19:32:27 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so26075266oto.13
 for <freedreno@lists.freedesktop.org>; Wed, 15 Dec 2021 11:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=KCcCNfuto1fwE5eENpKC+nkF/sRCm+bkNjr97zeXP5k=;
 b=AhonrVu+8ZlLbXNMR2eSNrdEE4oll8p9p2eAk4XvDMUN6TOEl7ESsoWlqAajD2BUlo
 Q3SP30lGjRDjFsRSbz+fLXShWL6Xw2O0DsLTwzZ/RtslkBzbKd+kRGEOy2Vq/gc+2J6O
 sMM13+zGYZSPKKUoikyktK9mtBV/VariK2nPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=KCcCNfuto1fwE5eENpKC+nkF/sRCm+bkNjr97zeXP5k=;
 b=TKxhuNZ1gXV2GhREuZe6n4G/ir/BAkfYxhzYhpgrrQty6nH1dBSBh7R/VhT/CqEO50
 sDFwWDgbeiDVPh1aZeGxjpdfK60SpxBZ8NQxlKRZ7vu6DZKPftcxOKknIFs6yducDnJo
 iiINlTqxUhI3rxPUse7MXiW/EQQzOZ6TFJxoB5QhQBHdHoHr9j6hGTyK9C9IpdaHSmqU
 9ItV2iwgOWLDtmy/cOIvnMCECj5bf4D+lb5+r4YEu01zcIvRe1oIuGo8xo+TlX2Zjpnk
 vv6aqxH1RkCDqEM3enVqyOJGzjOC0k9txJ8Zx327vRleoXOD4Zl4R2wadp5Aw06O1KNO
 AaeQ==
X-Gm-Message-State: AOAM5339aiwkGHIlZ5HYCJfsjJU7/w/If8Yy11YpCFrxyMzpxW9uwZ5O
 /Q5NY5OBnzw3aDeqCzuFQKrjv1zWNHmd9sCF2DhS4Q==
X-Google-Smtp-Source: ABdhPJyexg/795HehcLl8cNNfOqwAGaPZ/BtHR5KlkmgOJqRlq5kPbvEb0Ra/YXyAgX2GsXKtwH2fkUpUy+sB92eL9w=
X-Received: by 2002:a05:6830:30b7:: with SMTP id
 g23mr9739312ots.159.1639596747244; 
 Wed, 15 Dec 2021 11:32:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 11:32:26 -0800
MIME-Version: 1.0
In-Reply-To: <20211215085554.444351-1-deng.changcheng@zte.com.cn>
References: <20211215085554.444351-1-deng.changcheng@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 15 Dec 2021 11:32:26 -0800
Message-ID: <CAE-0n52Uf=rcGVxz1U3p6H+icOz1OoacdOFsQtDHCdcdKYTsJw@mail.gmail.com>
To: cgel.zte@gmail.com, robdclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove unneeded variable
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, quic_khsieh@quicinc.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, Changcheng Deng <deng.changcheng@zte.com.cn>,
 bjorn.andersson@linaro.org, sean@poorly.run, linux@roeck-us.net
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2021-12-15 00:55:54)
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
>
> Remove unneeded variable used to store return value.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
