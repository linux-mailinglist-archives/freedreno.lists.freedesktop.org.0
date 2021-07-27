Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E16253D7D36
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 20:13:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954026E0F6;
	Tue, 27 Jul 2021 18:13:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575376E0F6
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 18:13:41 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 h63-20020a9d14450000b02904ce97efee36so14341040oth.7
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jul 2021 11:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
 b=nKrFC4siEB5TMlf0Ki68ELxlcROLoP+EW8hSS9g1RRRSwJ8DskybY3HuBugBkwUgRk
 YuzHq7j3MrquDzlTixYwmfIdwrBY8dp20RExmfsKuFSCLvx2OJtCCS1CGh0fsxvL3EY6
 VnGlZXTO0PO0yEalK8LNcbCms/i7021GjZMj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=aKtC8a02oPudfVTvfPjLwqW431wvay6OO1xdiJh08rg=;
 b=o/oJesOMkohNQPhMxMSV84SFgleqvfNqlDZPU9yXJK1JxWn5OkcbfQz41GsdJ80png
 A9IA82oBLcpC1yA9rjTFiv5/mHhJc5mAU6ceDFHrbvqJQBUMpEHA5pBfjzzfTyHPdJr6
 hcHQKp5sX5A9By/O3FOFN9gRfmNlhVa3HISNXVDz3njquyTwMBIF2KkJYy1GI1CTYFIe
 iYZ1P26XVNrhf4dUnU+4PButdKca9bm8bnvO8U0Bn60mfHPNZibIXBgc7JpUsJ8H50wn
 XUwdyqaVzPuDsdkDp4j9AEUp/kUD3TPNluuLE99EnuQevUe0SygTD3eNwRgVF6OeCpd/
 qRBg==
X-Gm-Message-State: AOAM530b6WOsYQsCdz9GIvr+l2vfJKk2jsEmpfdTnKHdMOoCDHY9uu3a
 Wv2b7voWBtHwWRI9hPbSheEkvz4VLTroXtAXRStJog==
X-Google-Smtp-Source: ABdhPJy8UQyIpcBk4ZgmdXAlqDPodoBsHwvzpjrdu+G7df2CikTzmvsUFtRH5Qv9r+9c0uahcJGB/Z2SNB2pM8LZqfc=
X-Received: by 2002:a9d:1b6e:: with SMTP id l101mr16069312otl.34.1627409620250; 
 Tue, 27 Jul 2021 11:13:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jul 2021 14:13:39 -0400
MIME-Version: 1.0
In-Reply-To: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
References: <1627346298-11528-1-git-send-email-maitreye@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 27 Jul 2021 14:13:39 -0400
Message-ID: <CAE-0n50FtzCHyZay3__8Y+Cj6kZaTtx_wdRom1jDwx1E01xRgw@mail.gmail.com>
To: dri-devel@lists.freedesktop.org, maitreye <maitreye@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v6] drm/msm/dp: add logs across DP driver
 for ease of debugging
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
Cc: linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting maitreye (2021-07-26 17:38:18)
> From: Maitreyee Rao <maitreye@codeaurora.org>
>
> Add trace points across the MSM DP driver to help debug
> interop issues.
>
> Changes in v2:
>  - Got rid of redundant log messages.
>  - Added %#x instead of 0x%x wherever required.
>  - Got rid of __func__ calls in debug messages.
>  - Added newline wherever missing.
>
> Changes in v3:
>  - Got rid of redundant log messages.
>  - Unstuck colon from printf specifier in various places.
>
> Changes in v4:
>  - Changed goto statement and used if else-if
>
> Changes in v5:
>  - Changed if else if statement,
>    to not overwrite the ret variable multiple times.
> Changes in v6:
>  - Changed a wrong log message.
> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

It may also be good to add some logging into the dp_pm_resume() and
dp_pm_suspend() functions so that we can figure out what's going on with
all these problems due to disconnecting the cable during suspend.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
