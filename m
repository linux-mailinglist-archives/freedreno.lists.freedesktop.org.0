Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A58546E8E
	for <lists+freedreno@lfdr.de>; Fri, 10 Jun 2022 22:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B10113E1F;
	Fri, 10 Jun 2022 20:41:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103D6113E22
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 20:41:22 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so602522fac.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 Jun 2022 13:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=1wOc0J4fYT2fujAD0N/SFPgzt/fgt6blJDB3o4DP2ak=;
 b=HJndNUV/RX85HGvljX/EtGuC32YxOaIkn0U7bRqjBppXY0Jjfc12XCvOOYrw6VTM1g
 9OpOq0EKOn5tD06F+MsK7nJMe8SORGdywqBhNc2BWf+v9TSFSoNO75b2jXiBnvpA+PYA
 kaUbt9thYk41DLzgsEZlgZpMmvd/4p2oTDqx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=1wOc0J4fYT2fujAD0N/SFPgzt/fgt6blJDB3o4DP2ak=;
 b=HpG+12hn68THrfRHBTzdAZrbDJ4qLNccSpv1c/AeqGG1R29TpAlIhxfdWdwHNBpKLq
 DrZ8xYra8PYQZL7wxC9fklvbFIQHEkAvJZ4ipWNHS4K8HORLznpPfwMdYNnDYEC7oxlm
 ONUaMHdsd/VOqy1EQF6KJy8vIgp1x3ZX2GhPjJQrQs0xvjEAmVxt/XSyZVml0tokxGvg
 L5cyMuRFd2TPJihE6BthYTzMny95hRQS9N7JbEGuQrVg4sQ9pE6cUvPWbQRb4yETox6Z
 tamsuEzVJVMiUoHh/FnTStdUSPo4DQwLvLWnExgND1n/7UO//PnmuE77NhlqAOAg5VnW
 3JRQ==
X-Gm-Message-State: AOAM530MIj+U7+trIXZ2Bsi4ty6vZ6zZN99Dwq4AqBrzdBEBfU6ChtlC
 roEd78sPbzyPuW26O/q218wYY53ZVbBm+PDa+gGlyA==
X-Google-Smtp-Source: ABdhPJy1FIFw0/ZajJ73h4iKWxSpPY7TneAyV/yA60TeLcm44Rt1c746tdIuod7oRox8ozRoNH+AI+oN7vt+zXmGddg=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr927327oap.63.1654893681353; Fri, 10 Jun
 2022 13:41:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:41:20 -0700
MIME-Version: 1.0
In-Reply-To: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
References: <20220609113148.3149194-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 13:41:20 -0700
Message-ID: <CAE-0n502VOOw2bU7f+Qb4_JeH1WgWL49gxk12QNrGrxH-GFs7A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/hdmi: fill the pwr_regs bulk
 regulators
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-09 04:31:48)
> Conversion to use bulk regulator API omitted filling the pwr_regs with
> proper regulator IDs. This was left unnoticed, since none of my testing
> platforms has used the pwr_regs. Fix this by propagating regulator ids
> properly.
>
> Fixes: 31b3b1f5e352 ("drm/msm/hdmi: use bulk regulator API")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
