Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF854454116
	for <lists+freedreno@lfdr.de>; Wed, 17 Nov 2021 07:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7316E21A;
	Wed, 17 Nov 2021 06:43:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00676E1F1
 for <freedreno@lists.freedesktop.org>; Wed, 17 Nov 2021 06:43:41 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bk14so4237514oib.7
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 22:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
 b=cDTxUGFgV+D2sWJDHB8Zi9H3rp6GLIGbwCi5qGeau2co/SriSjaDiymu3yDRMT1rF5
 4a6UtJ7a6xWVyKz8fWziI1O/HDtR/5w9dXosg9B+rWhGtewQxhYEoSFzoY1eyJMEaqwK
 nwkal6A6S+uqNqnk52M/yvJgNQF8JtK9UimdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yTAfmJ0bF8bSpAIUOFMDRewe/b9IF2HUsW2XZzfQGbY=;
 b=VC54kGgy40AFi68UvaqdXDOS4xj5KAXct/0LkGaTXeBOpKtXaOHhPWOjH46bPE3TAa
 x/YhvfobO634VHkp1C0xxpVTE2OjQM72Rn8RDRJ73q9H8aECQUZlSMei+1bIb47QALOb
 hcGHeEelL1mWgvBfKrofByxWKXtK7fDH3cXJZPz5AG0XJtwFYwJcn9B5j+tDHzw+LKeH
 Wn3An0Cu6xdnblfofpJ4IFGdU9xaNH8fljtdxSjg52KP1j6r8eOVaZ3WkMOsUdlj5H8V
 NR8wQ6F/PoBCcIM0HEgxCQq/JqfibUkB5spVUdRaf8jTmhODLE7ICcfj9ggZ+H+Z9PHx
 Y7ow==
X-Gm-Message-State: AOAM532phQlXdc5uDH1gyHpAGpL+cDGmExjaqLd7BKVjgZOSjoLUKWRp
 Q+ZLxgmE9kEtOAFGbv6dKpMpekswkyHrrKjkExq5Bw==
X-Google-Smtp-Source: ABdhPJy9zCKUwdtUbQh78Q+Mv0EaKjj2J6iuCujpOCBSenzXXg7GYdTuGTdgDNcZxW1F9VTN+CjK8QtCOOdSrwB/lfM=
X-Received: by 2002:a05:6808:211f:: with SMTP id
 r31mr12120140oiw.64.1637131421167; 
 Tue, 16 Nov 2021 22:43:41 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:43:40 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-3-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:43:40 -0800
Message-ID: <CAE-0n52n1qzrODJuFN7pnWvj-31uGop9h+HTUY7wXuuX_sO2SQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 2/3] phy: qcom: Add support for eDP PHY
 on sc7280
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:37)
> The sc7280 platform supports native eDP controller and PHY.
> This change will add support for the eDP PHY on sc7280.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
