Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4704B7D75
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC85010E60D;
	Wed, 16 Feb 2022 02:24:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692F10E609
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:24:13 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 e19-20020a4ab993000000b0031a98fe3a9dso307050oop.6
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=jfG2Bu8rOh2uqc/O2UGw/gH2EhdubksUqfjQyQ5UvPw=;
 b=dfs6y1eCCEopS42ue+mXzRktsoR6kFYC3xyIRj0wOxbUjltkW6LkuO4rIrlUlBMlS3
 0XgSZxJMNnsl6jwbuCO6W66heGxt1jwkG5MQSsYw5jpGBiLkuW0QY3TRchGICS2X6neh
 +xjRe4vpVwvzt0VeJXwLwOGDfW8mdNpyhT8qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=jfG2Bu8rOh2uqc/O2UGw/gH2EhdubksUqfjQyQ5UvPw=;
 b=tUR1eo6/p6mRUgBzQlpvO6mONexWtGitpDDHsb5StbA2s8BcipgE+ULMeBD7y/09uk
 7KqWdY92pwhxDUV+6t/aOwajpEkaqsV72HXPoYFRy1FIxg5CDuleqJBujdUE+9dFBMdp
 G6HqnIKpe629ZXDZWlpcWPJD67KD9RWgSkjkbpOqPzxFfMbNxJ7D8WMTx+tLTZcsAqLs
 ICHXpX9dE8nWkjaCWtAkQEHZeCGM04mUHh525Embeq0NIQhMTtJOlIILgAEV63dqUxDc
 ZZVEYuBlZPeqtVEEzHbLpfARX5BrG7/RA8XCg44MF9J7l7OkkvDpb9lcyHGqNhq9pD55
 IxKA==
X-Gm-Message-State: AOAM531A0c08T0ffg8fif1y5LToW1YSTK9Hs8sStgnKuppZGv7o7hVDH
 Mf2Tw4NZ3aDCObdqtLL1uZRVqN9B3SN31TsTwVLW9A==
X-Google-Smtp-Source: ABdhPJw/S7QW9ZSFsJb+EoQ7pPcn1JThwoSbzHfsJVcP/iSPgthUTHYweAWJg73YKGbDLvo+yewIr6atDg5ZmEoMZ7Y=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr230198oon.25.1644978252887; Tue, 15 Feb
 2022 18:24:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:24:12 -0800
MIME-Version: 1.0
In-Reply-To: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
References: <20220212003811.1818774-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:24:12 -0800
Message-ID: <CAE-0n5320WA0ZdCdBOAmkjXv2E1u8f+RANcDhhvgpzrR+51Vdg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dpu: Only create debugfs for
 PRIMARY minor
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

Quoting Dmitry Baryshkov (2022-02-11 16:38:11)
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> dpu_kms_debugfs_init() is invoked for each minor being registered. Most
> of the files created are unrelated to the minor, so there's no reason to
> present them per minor.
> The exception to this is the DisplayPort code, which ends up invoking
> dp_debug_get() for each minor, each time associate the allocated object
> with dp->debug.
>
> As such dp_debug will create debugfs files in both the PRIMARY and the
> RENDER minor's debugfs directory, but only the last reference will be
> remembered.
>
> The only use of this reference today is in the cleanup path in
> dp_display_deinit_sub_modules() and the dp_debug_private object does
> outlive the debugfs entries in either case, so there doesn't seem to be
> any adverse effects of this, but per the code the current behavior is
> unexpected, so change it to only create debugfs files for the PRIMARY
> minor.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [DB: slightly change description and in-patch comment]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
