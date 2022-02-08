Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CDF4ACCBC
	for <lists+freedreno@lfdr.de>; Tue,  8 Feb 2022 01:18:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60210E2E6;
	Tue,  8 Feb 2022 00:18:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB0510E2E6
 for <freedreno@lists.freedesktop.org>; Tue,  8 Feb 2022 00:18:57 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id 9so19204396iou.2
 for <freedreno@lists.freedesktop.org>; Mon, 07 Feb 2022 16:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
 b=TV/KEXy0SdalYrBG9vcyQo4ANXKRqQZpfsevkQCRvDDS3QkNqsAVFK3CiXgrn7BhEC
 lQZP1zue6xcSxErPJDsPnbnJ7NzZaPCUltMJoeN9SGtNIMM3tb2qVUWD6hCx2/5gvyQb
 4WVzprlonmdeJ8JUjSQiAOvjj5o67UrS7+Dfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vScBC3jkunPuKV71bwmpHxOhrGxKlBbuYe/cqBu7qF8=;
 b=g5SxbBFAH0c15sbLB1EDYMQdGaIdz2jsuGPCmYNrnARbkT1EROZpp7U43ChTwKbcqf
 FJ9v5aYJH4L20YrnbHijmumEA1CK6p0T82faa8j6nUxVuYgXjlROr3i+BU2M2MsVY9As
 0b8WKICA09c6F6J2EZfC7Jjvop2HUL38X6f+a5wMI69Q9klXZ+bPH8biBliwF8aaG1rf
 ls1B+kTzhzDKf52EtzDPU1kMPqkfa+31STxxTQH5WAlbxIdQ8bmQEVmNRqOjd7bUf8AH
 oM7xnGgVtP53eKvU5/bWs4Pi4X9F0hua1VsOfi/DsxOKMBgGuwnm+kKPGL0UfeE+WigS
 OUvg==
X-Gm-Message-State: AOAM532WIr1V10/6lpdZ2lGK9x5gCDrm61nGj1ejg4dRR9eqvvPd209B
 F6eoXNYPYP5h979OS+Z0D/s/J3FRQM9uyw==
X-Google-Smtp-Source: ABdhPJzVRdhcO/7DD170ZT8WUCb2Oq0IBziSJw2ttbIcgwMKKUiZnrwO1pONPqiwPIb6mByKEfG+Ww==
X-Received: by 2002:a02:6988:: with SMTP id e130mr989141jac.120.1644279536068; 
 Mon, 07 Feb 2022 16:18:56 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id s12sm6658685ilv.40.2022.02.07.16.18.54
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 16:18:54 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id m185so10882656iof.10
 for <freedreno@lists.freedesktop.org>; Mon, 07 Feb 2022 16:18:54 -0800 (PST)
X-Received: by 2002:a05:6638:168d:: with SMTP id
 f13mr980261jat.44.1644279533953; 
 Mon, 07 Feb 2022 16:18:53 -0800 (PST)
MIME-Version: 1.0
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
In-Reply-To: <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 7 Feb 2022 16:18:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
Message-ID: <CAD=FV=VwrO9fpOtpjrsbjkmucvL6NbHMc3jLtjsiRJD6aG0Hkg@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 0/3] Add support for eDP PHY on SC7280
 platform
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
Cc: quic_kalyant@quicinc.com, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, quic_abhinavk@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, linux-phy@lists.infradead.org,
 quic_mkrishn@quicinc.com, quic_khsieh@quicinc.com,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Feb 2, 2022 at 1:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sankeerth Billakanti (2021-11-15 23:07:35)
> > This series adds support for the eDP PHY on Qualcomm SC7280 platform.
> > The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
> > https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135
> >
> > Sankeerth Billakanti (3):
> >   dt-bindings: phy: Add eDP PHY compatible for sc7280
> >   phy: qcom: Add support for eDP PHY on sc7280
> >   phy: qcom: Program SSC only if supported by sink
>
> This series was sent to the wrong maintainers. It's in the phy
> framework, not the drm framework. Please use scripts/get_maintainers.pl
> to find the right email addresses and send this series again.

To help out, I've re-posted this myself, hopefully getting all the
correct maintainers.

https://lore.kernel.org/r/20220208001704.367069-1-dianders@chromium.org
