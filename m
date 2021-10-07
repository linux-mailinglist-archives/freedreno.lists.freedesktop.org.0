Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EC425AE3
	for <lists+freedreno@lfdr.de>; Thu,  7 Oct 2021 20:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9D6E58E;
	Thu,  7 Oct 2021 18:36:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27786E5A5
 for <freedreno@lists.freedesktop.org>; Thu,  7 Oct 2021 18:36:34 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id z11so10284253oih.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
 b=n6Udo2L3qo9ewMgIMq6Wrg7OauFR7+TAdle2qBkii7z5UBvbpCoYA9B5dQnhx3GIBd
 9wLuYh4nmPIVfNlB+L/C6J7vH6upTD6cMqTPd/1pT4Ha8nX+FKMMVYB575+4dtNw6ahN
 JgO8vUqKyWCgtonWsz1UR0AlRLIq/HUinMtkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=DPdfz9LhT10yj1lJd14D9Hv0w+VSu7/Sd0PK057Fl6c=;
 b=U0ovkmGOm6nQ878sJJgFQrmYCJNHczfJOO4uQg6TsAyjQ/8I4Firo3Fks8pEsDAXFO
 Ji1uoa5+qVegICJ+ztl2xLmT9xHRSVGc6N7VfwNQoDz1CBMlmm0dFG6QE8//CY50zRYT
 5O5ATyFN42k3s6eD+EgCmH4hjsw9gVMQr85iJkjdRiAoEnf004Dh0OmNp8wjYBKdDRJs
 Uz+6/tP+2xrcI+8oTyBrkPC3xnrDycsYIBRQakmCbnB/2XhgayisdusvvAGEKgYnnQFq
 b2h11QKprOL1a+eOEyh1rhB9r/drB29WFwZBtnbNRlroNd4C8Yf+0jtfLaswnc3iJhSV
 YdjA==
X-Gm-Message-State: AOAM531fHJneI5r0pstlNxKgLd+RkXtGjbqGCGOUgE4kLAgdGjx1mjml
 sMnQMsDEvLlakQynRjbm9GBev8ImpiIrc46iWRaAHg==
X-Google-Smtp-Source: ABdhPJxnk8wPPWLKoztpzfVpE4n3ciqpxU3bIEXabE4aZHMsOYfoUNUAEeSniGODpn7Ty3KRhEyp+3b/mIQHV2sfOdA=
X-Received: by 2002:aca:42d7:: with SMTP id p206mr13154401oia.32.1633631794025; 
 Thu, 07 Oct 2021 11:36:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 14:36:33 -0400
MIME-Version: 1.0
In-Reply-To: <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-2-swboyd@chromium.org>
 <YV5KpZJJIk46Nge4@pendragon.ideasonboard.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 14:36:33 -0400
Message-ID: <CAE-0n50nb4n4QZzKbCmKbutHWPogKrEyCvW_9M6+xHs7WFiibw@mail.gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 01/34] component: Introduce struct
 aggregate_device
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-10-06 18:17:25)
> Hi Stephen,
>
> Thank you for the patch.
>
> On Wed, Oct 06, 2021 at 12:37:46PM -0700, Stephen Boyd wrote:
> > Replace 'struct master' with 'struct aggregate_device' and then rename
> > 'master' to 'adev' everywhere in the code. While we're here, put a
> > struct device inside the aggregate device so that we can register it
> > with a bus_type in the next patch.
>
> Not "while at it" please. The signal to noise ratio is very high here.
> Adding the struct device in the structure is the important change that
> needs to be properly reviewed and discussed, the rename is noise. You're
> even adding an IDA and an id without mentioning it at all in the commit
> message. This should be split in two patches, you can decide whether to
> perform the rename at the bottom or top of the series (it would be more
> logical to group all renames together though, there's currently one in
> 01/34 and one in 34/34, so please group them both at the top or bottom).

Got it. I will split the rename from this change and let things lie
until I change that line.
