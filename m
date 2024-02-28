Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0ED86ACA3
	for <lists+freedreno@lfdr.de>; Wed, 28 Feb 2024 12:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53ACB10E63A;
	Wed, 28 Feb 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L+FsVwrj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64AA10E63A
 for <freedreno@lists.freedesktop.org>; Wed, 28 Feb 2024 11:08:17 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-dc238cb1b17so5720200276.0
 for <freedreno@lists.freedesktop.org>; Wed, 28 Feb 2024 03:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709118496; x=1709723296; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
 b=L+FsVwrjHKyv7qSJ13HsV2VDUbR74ajyIXwlVD9QhD3vfq9ZZiJI0r9fH+dA7mu91d
 SOoLdx3XjKDFkQ1Rr6USVAtEohxc7R76n5bF4c25Rrbh1Rx5H5oFH/c/SNVCk6S+xpQ3
 z8kUzT04pk3HUbamHHBNIGnxYjNFY9eMQgfn9Ak1tqA0G70lvdntgHsegafviXNPXeuk
 gZ6vDdLGvAea88eq45RLH1FKFj8OZ2uBhxJJP/ucV8sdOx+YYx2sQDy6X38SVzKXhy6p
 lU2ERSVhX1apnyVDuYDRdgfPNopWV7aWjg9gezmjI8kCWJbYcC8PU7kO95S30VzOgF5t
 lO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709118496; x=1709723296;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJmCHtzXEM7iHGUAof2e0JKiHgjZvY6I5vD12R0EcB0=;
 b=IKTEVdpA03mwkR+3Cz9s/0JJx/usDMksSRwkk1ts8NKKC+nQJ+K5rIzAmSKXYx8/a1
 dLq3xhkFLIB6KlutXSLD4UCO7lmenooqqniwuWXKTi7RfW8GW9nOzp2CxkksOzO3YBLn
 QDmkucnt3ayZbuTtvN33C8zGusX3Q46qg/aiXkSVayqL53QkH2A+9vpvyqBh7a9/Ga6E
 zmde7SV0Z6cckEJY0ALzmE39xO/J4W29fMOid3BOi+OKBMJSMB+T08LNqRgEYFUl3Ck8
 U9MXDzU+lqDipe58V/I1NXqdzfzajd4/NL/kpZwWxB/uxhvjEhelj3vMWj7DkDSprbG0
 KbDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU41Br9iyQdTyalS8VVUoy2ZS+xMrxS9tkk12fVSCtebsUE3dVZ2EaUWQlt8MXjQeIkWX6jxbpoCaw9+veTeLezEH1bgE4hT5dJIjwGOGPv
X-Gm-Message-State: AOJu0YxXbuiceLSPo8aQ8ERixdAIelZdwaz22UhONYrsuC1gjUs6CZ4M
 6ZElk5eB0ZFdsGnI/FQ1NqZkmJQl0pX3TdWafVwwx9bP/RRjJCsvjcsgecFKWmDlm9cA1XidA7q
 F/q5+J+KfS2P9VtPjTMSzDbmwpjrSdLGP65QUcw==
X-Google-Smtp-Source: AGHT+IE7FGesh2EjL5jyHeDznjzn/ZbnUFCAT6CsdLQR0L++/z1KEBV5qW9/rZM2L2bRBaXEmeKKtOqYWbh1cGbCgjg=
X-Received: by 2002:a05:6902:2192:b0:dcc:5aa1:7ac3 with SMTP id
 dl18-20020a056902219200b00dcc5aa17ac3mr2290311ybb.2.1709118496390; Wed, 28
 Feb 2024 03:08:16 -0800 (PST)
MIME-Version: 1.0
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
In-Reply-To: <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Feb 2024 13:08:04 +0200
Message-ID: <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 28 Feb 2024 at 11:50, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
> > On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
> > > This reverts commit e467e0bde881 ("drm/msm/dp: use
> > > drm_bridge_hpd_notify() to report HPD status changes").
> > >
> > > The commit changed the way how the MSM DP driver communicates
> > > HPD-related events to the userspace. The mentioned commit made some of
> > > the HPD events being reported earlier. This way userspace starts poking
> > > around. It interacts in a bad way with the dp_bridge_detect and the
> > > driver's state machine, ending up either with the very long delays
> > > during hotplug detection or even inability of the DP driver to report
> > > the display as connected.
> > >
> > > A proper fix will involve redesigning of the HPD handling in the MSM DP
> > > driver. It is underway, but it will be intrusive and can not be thought
> > > about as a simple fix for the issue. Thus, revert the offending commit.
> >
> > Yes, for fixing this on 6.9 I am fine with this.
>
> Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?

In the worst case it will land to 6.8.x via the stable tree process.

>
> > I hope there were not other changes which were built on top of this. So
> > it will be better if we retest internal HPD case as well with this.
> >
> > We will do that in a day or two and give Tested-by.
>
> Johan



-- 
With best wishes
Dmitry
