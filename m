Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E2D3E85A7
	for <lists+freedreno@lfdr.de>; Tue, 10 Aug 2021 23:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2A58973E;
	Tue, 10 Aug 2021 21:49:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6899D8973E
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 21:49:40 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 r16-20020a0568304190b02904f26cead745so835958otu.10
 for <freedreno@lists.freedesktop.org>; Tue, 10 Aug 2021 14:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=+HYiu1hW88Bpj8WftJ5CqOz/LeBLWxJEO+HNgAITcxU=;
 b=f/xWfkbKitmRmGG+Ekhc7MQBa3QgQs/6Zk8sKw0qdYl62Xwpi3CX4mYHsahRMBxy5f
 Ik1Q9sJy77ceI/3yp+qhALsMcAcLPD3NleInGIoO8w0rtylP7FsxDgC5kWN4LrhjNToV
 HGyfInuryvPdOPn/iUR7AO21+najA4fciE/lE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=+HYiu1hW88Bpj8WftJ5CqOz/LeBLWxJEO+HNgAITcxU=;
 b=eYMElSUgy4q2Qfk1MQE+xoG8Xawcu/lWBDsdhXElnV+ECMTJFhusNu9iBdeeKHZ36I
 XSoiPbv/WKVD6oeryvAb+qvHm2ZGrApX9Vl0wRJzUPyU1lOQxK6a6nxJO0D9fVOBN4V7
 xf4lwPEruHL1t96DJsvDz/iL37Ud6G5iq24pljpCMfxAL9/DjSSHV0I+rzAF8JrAG4F9
 eh5oYop4fDv+IcEJIhR7KZesb0QqRyYUxoF+6doqVm4+zQAQ+u4W9vW7AFaQWVkgHfdX
 h9OzUtGmtrOPoG79Hwa/H191CZ0VOD8UxULe1rH5grrDTA0KU+uTS9v5kCGHiMQgapdC
 swWQ==
X-Gm-Message-State: AOAM530d2jLM/Hpw+kJvkiQ44X+dbT6ZIcsl0RF7TCQYdC8rR58NZTlY
 bw6zqQXD7XPQg0dBDsQKCTIBNEP3SdbOP6Dk6uhfMQ==
X-Google-Smtp-Source: ABdhPJwWB0tX5GDFBeHZ1LiAt30TiVNcHXV5DfsWQz9Zp1GM9/8CHg1+g2E6eAgybkGTqrk8/i3G9uSY7xs2fWzT30k=
X-Received: by 2002:a05:6830:44a7:: with SMTP id
 r39mr22563794otv.25.1628632179611; 
 Tue, 10 Aug 2021 14:49:39 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 14:49:39 -0700
MIME-Version: 1.0
In-Reply-To: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
References: <1628196295-7382-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 10 Aug 2021 14:49:39 -0700
Message-ID: <CAE-0n506f7yb3g7bGj0Xk43qL1Xw2Qzo5nRw76sdAYZz3NhO9w@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie, 
 daniel@ffwll.ch, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/6] add fixes to pass DP Link Layer
 compliance test cases
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

Quoting Kuogee Hsieh (2021-08-05 13:44:49)
> add fixes to pass DP Link Layer compliance test cases
>
> Kuogee Hsieh (6):
>   drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
>   drm/msm/dp: reduce link rate if failed at link training 1
>   drm/msm/dp: reset aux controller after dp_aux_cmd_fifo_tx() failed.
>   drm/msm/dp: replug event is converted into an unplug followed by an
>     plug events
>   drm/msm/dp: return correct edid checksum after corrupted edid checksum
>     read
>   drm/msm/dp: do not end dp link training until video is ready

I'm still able to use my Apple dongle with these patches so

Tested-by: Stephen Boyd <swboyd@chromium.org>
