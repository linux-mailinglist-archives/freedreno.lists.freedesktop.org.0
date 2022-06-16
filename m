Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7354DA66
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 08:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC0E113EA2;
	Thu, 16 Jun 2022 06:18:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55BC10E0CD
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 06:18:26 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id l81so767009oif.9
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 23:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ERiv85HXPykv6Vexpi0EDa7S1Wy2bympoq4JFQSE9ZQ=;
 b=RL2REGVUqf65hENgPQywPtsEIw6c3XJsAgle9HD1og+f+CRfM56gU14bS/OsS74g6i
 R+ZsXxXSd4uqGap3a6AFUanNAxvIjm3vfwxKQvQAbkL8Urgel2GHThjQRyVzBNN9sfwP
 a4sX4HIFhZU6G5vZfeoCUs/H0cVhGDw7vTVgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ERiv85HXPykv6Vexpi0EDa7S1Wy2bympoq4JFQSE9ZQ=;
 b=YX6yviKsiFXOeFTP8w0SQls5KCZU18r2aFf1VNoRVtP6rcwiJ6NwFpg0GeBLWBGZwZ
 dcAkQAyQNRwCAlpq6Vu36hmSmkUPRS0PC1dZ27EYzmVzad0XH+aoDv5sl4x03XQTFfag
 m3IcCeL18V2KOECNXpzoGarIMDOorrh1TQX4Ui+H031ZzKMcKK5FdoLvzsZEDO27qLNi
 rWiwBEYRrSrKulMYoIvGVL9MkKCcI4VeI6iadmK9Uo6qG54ncXBONPgNb/sHUS7SiuP5
 V2OPXwuzWOZf3+heqmv9R2zvy/7bS9+IYgrs5oFSVZtAVfX25WwHJYbbRqBpG6HD+23/
 KPjA==
X-Gm-Message-State: AJIora9DbFJU/pki9ovPfJji0PhJHlRBXkab6vaIQd7vlR6zPyuLfHgz
 huNZCDJeXOoBxJ4qBoUDq3SlPJYAaNCbsGENG4+EiQ==
X-Google-Smtp-Source: AGRyM1v1rCAEk2kAp7sSsZrrr/lq0x0azniMU+OhO/lwidvszL/Q6IU9Odzw5oupZ0BadIsESy/cAQpZvzK94V+T18o=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr1773813oib.63.1655360306065; Wed, 15
 Jun 2022 23:18:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jun 2022 23:18:25 -0700
MIME-Version: 1.0
In-Reply-To: <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
 <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 15 Jun 2022 23:18:25 -0700
Message-ID: <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: move intf and wb
 assignment to dpu_encoder_setup_display()
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
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org,
 daniel@ffwll.ch, quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-06-15 22:59:25)
> Hi Dmitry
>
> On 6/15/2022 10:55 PM, Dmitry Baryshkov wrote:
> > On 14/06/2022 22:32, Abhinav Kumar wrote:
> >> intf and wb resources are not dependent on the rm global
> >> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
> >>
> >> Move the allocation of intf and wb resources to
> >> dpu_encoder_setup_display()
> >> so that we can utilize the hw caps even during atomic_check() phase.
> >>
> >> Since dpu_encoder_setup_display() already has protection against
> >> setting invalid intf_idx and wb_idx, these checks can now
> >> be dropped as well.
> >>
> >> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual
> >> encoder")
> >
> > Please adjust the Fixes tags in all three commits. I didn't notice this
> > beforehand and Stephen has complained.

I think Stephen is Stephen Rothwell.

> >
> Is something wrong with the tag? Format and hash looked right to me.

	$ git config pretty.fixes
	Fixes: %h ("%s")
	$ git help fixes
	'fixes' is aliased to 'show -s --pretty=fixes'
	$ git fixes e02a559a720f
	Fixes: e02a559a720f ("drm/msm/dpu: make changes to dpu_encoder to
support virtual encoder")

it's missing the drm/msm/dpu prefix.
