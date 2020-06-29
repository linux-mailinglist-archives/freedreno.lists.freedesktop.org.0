Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3916A20DCEF
	for <lists+freedreno@lfdr.de>; Mon, 29 Jun 2020 22:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE0489FC3;
	Mon, 29 Jun 2020 20:45:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA8A89FCA
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 20:45:25 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id u6so3000589uau.8
 for <freedreno@lists.freedesktop.org>; Mon, 29 Jun 2020 13:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
 b=np8GQKHletK7G3CJusLVB9GC+G7QJF/kREt9GxLJ1t3Hlt3hdOPYI7AnTqvqvfjjOh
 XTfgB9NlwsFFJPFFY/3WXO2tvqKQyGWdikLrXJA5twdfvWv6WqsfZ8fbSnJ761heXjn9
 vHh9j+YN5HmSWr/N6yqL9vCMgNC/cINJ2irupbhcqOWIFiVYa2coSiBY23Qs4cG4b/ie
 cUcy4Xxu/2VK8s6dDPcsm9MWe4pGDUccuyqfsEfwzQSOtHKWPVj5rEL732Fq4SCxwmox
 8LSPZSwt63n11b2S6g6OLJdtEXt+dK5kugr9Rn/1xTEMZV2pqm/UsihoKln3VyxotYET
 UjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w7kFF6I/7tjyYaS1rtr5oIMqxgnM+l1sJPudiJl+Cto=;
 b=WkVhRJiQRja3a40NgyXj85nealQiyEtqsob8j87LfW5ij51aLQlbQIw1kXhweM5ktU
 xS2r8MF67AL5sHv9/gmehblS6iLRoV+cc1HN6NpMS/PAcL0jHXpyTwdiv/V8flcBCEK9
 86PMGUNUFERgzABOrB7aWxgR3UYcLd7r9EuzVLYQDPx6/njkcldx1gGZ0tk31/CAxYlP
 ZJdwSkTUdGm0kdvgswINfOuZZARn1hlpc/lPdZelYghoKix226k0zlfpp8kH6XY6wgg5
 ITLQAaqrbDM9lUjM5hrCAoSbjsZa8HmC1QplBheFSQXX6PYw63VVXgTokjunf7cq1H7Y
 nLpQ==
X-Gm-Message-State: AOAM5323wV2I2f8DXu0Lvk1B1klJDOdKOUU344DiUnO4RxirpPgn/z2/
 kLFPb4xmcxBVi5pQm+NIyceERRgGyzBTm9KvWpPoxA==
X-Google-Smtp-Source: ABdhPJxJKIf8c61d6Sxw032JzZeDqSjWcveZhm6ih/0vZLyM07fRcVrc1Lj+/k5p5DI0zMqvLZYhwCd5VnyTNVlYSEQ=
X-Received: by 2002:a9f:3b18:: with SMTP id i24mr12193440uah.52.1593463524191; 
 Mon, 29 Jun 2020 13:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <1593087419-903-1-git-send-email-kalyan_t@codeaurora.org>
 <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
In-Reply-To: <CAD=FV=VXAQagbM-dn7MWGm08DdBxefc4jHNbkvHzuBjSM_jWnw@mail.gmail.com>
From: Kristian Kristensen <hoegsberg@google.com>
Date: Mon, 29 Jun 2020 13:45:13 -0700
Message-ID: <CAOPc6T=E68D8NG+hkRH6WTnYBcCzq=-H6q1M_NVoU9S6eGkxFg@mail.gmail.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [Freedreno] [v2] drm/msm/dpu: add support for dither block in
 display
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, travitej@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 nganji@codeaurora.org, Sean Paul <seanpaul@chromium.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Yes, this is a big improvement for the display I have here. Thanks Kalyan.

Tested-by: Kristian H. Kristensen <hoegsberg@google.com>

On Thu, Jun 25, 2020 at 3:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jun 25, 2020 at 5:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change enables dither block for primary interface
> > in display.
> >
> > Enabled for 6bpc in the current version.
> >
> > Changes in v1:
> >  - Remove redundant error checks (Rob).
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 39 +++++++++++++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 63 +++++++++++++++++++++----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 28 +++++++++++
> >  3 files changed, 121 insertions(+), 9 deletions(-)
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
