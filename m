Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CE54DD030
	for <lists+freedreno@lfdr.de>; Thu, 17 Mar 2022 22:28:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DE410E112;
	Thu, 17 Mar 2022 21:28:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458910E7D6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 21:28:49 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so4376380otq.11
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Wxg6FN4fidpdw1pUe2v+Gv21R1xMKjCVI2Ma6qmxE+s=;
 b=YI0XmL/YEuCwf0gr7y2Jn0qOvFsTIVkrGn7O2oXnejI1FzWaaAXICnzW6eT0NGBp0/
 t5S3QB5hQ5GCTqzWxSIARnPm/lnGHIa5r+7HF8e9E/1MY22QKIGbjLDP0pZWa/36heFc
 PB3PqmNMOxM64rqIgvtk5bgg6An62is7W7S3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Wxg6FN4fidpdw1pUe2v+Gv21R1xMKjCVI2Ma6qmxE+s=;
 b=omrY3+Re8WysqMMCDbrJ0wSpeev8hTSuoigL0YW7Su54hWWtoI3MaXdl5vhWrHh0Gu
 EhPwU2RKFD3tZogUanB6nKLVvSNK3NWICKwiWhNxob2nyLOzaN5RHebTx9PYRmEvwyMk
 +UCbNzbY9ZWvdINsFqAPGONOMSpMZIYa0GmOjb2WOC8DP388SyHqN/V7NRYFD3VgVmT6
 cquPqqpR9apCXHIrp38Fpoyl959103W2iuZwR6QuhTOZK8y4l2vpjol1VnkmXE20Npva
 khbqs7IkxsH2v6NiBnC4OKOkF6mdJ2IRBLBFMNSgKQPfZ1PFh422UT4htNOsP9vadSLX
 WiPg==
X-Gm-Message-State: AOAM530X8SP82dYUkD5itH/nhtWNzYgpwhK7H460jGTajzCly/BljeCK
 jw1Y55NYlkdTul7ixjdo2A2J2jDhVBwUg9pS6bVTcA==
X-Google-Smtp-Source: ABdhPJzfKwOyCQB89/1kypJLAVwmpsZBjI2HMBT6fk9/KnCBqKd71dAxcwXBdFRDHPmVXDNHWkl2g1s53kSR7dGQ/iM=
X-Received: by 2002:a9d:5a01:0:b0:5b2:5b6c:232b with SMTP id
 v1-20020a9d5a01000000b005b25b6c232bmr2272582oth.159.1647552528145; Thu, 17
 Mar 2022 14:28:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Mar 2022 17:28:47 -0400
MIME-Version: 1.0
In-Reply-To: <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-5-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 17 Mar 2022 17:28:47 -0400
Message-ID: <CAE-0n51YMT76PTkfMV0dZ2d7e3mbObPvTo+AyuaTn4j0R3OwUw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 4/9] drm/panel-edp: add LQ140M1JW46 edp
 panel entry
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_vproddut@quicinc.com,
 airlied@linux.ie, sam@ravnborg.org, quic_abhinavk@quicinc.com,
 robh+dt@kernel.org, quic_khsieh@quicinc.com, robdclark@gmail.com,
 agross@kernel.org, seanpaul@chromium.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, thierry.reding@gmail.com, krzk+dt@kernel.org,
 bjorn.andersson@linaro.org, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2022-03-16 10:35:49)
> Add panel identification entry for the sharp LQ140M1JW46 eDP panel
> with power sequencing delay information.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
