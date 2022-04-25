Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC8250ECB1
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 01:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2E10E3E3;
	Mon, 25 Apr 2022 23:36:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B6DF10E274
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 23:36:29 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id z2so18929448oic.6
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=8CYkzLyZNDYyfxPkGfe6LKGFiAIegv8y3Y+39SG6y/0=;
 b=iElhaDiq7666Pe1ltzVcIyHEia/YX/Pc93gZQXu5H76/L7MrqrNRsMlMKCoQWEbulH
 oTBC6SEunGrcGhSMfhUj9r7Tk1YjTxapEgEJPbxbH6QAWfuzFo4pJ/Yr6AGR7CZ2mKvi
 D1GkWs8F2kN0J0jGUUtBQOWmJav+YgbFPXpXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=8CYkzLyZNDYyfxPkGfe6LKGFiAIegv8y3Y+39SG6y/0=;
 b=hB3Vr3v+OHPeeFqP1C+peuKtAvanbhJ7f5rtfCvhYwktmiz4DOZ1OWR2dLOeIZcUpu
 V3QHnAVBLHDLkMKsvR3or7fGexoyTYJ3FOCmo8AaxxTBbewDi9Mh74mZcYGjSqiaNLEb
 pHyWLlOeiOcDL5PH+H39I21CIQrWAEvQ6RkV53FZkl/eF4xf9gYTxh1Wn9jy7QqHA87y
 hFL/zMURJzAsOSXvRkvC2MtDQcV9nyqqgXzRPbCW5rpnLw+XkPAM0XbdiBEHsZlUFpdv
 rmS1ipoCEtp/GubUamkFvoxTAy7u2gJR6f19E8E+JgKGxAuBWT+MSoKufrI8ZoVbB2oX
 ZJnQ==
X-Gm-Message-State: AOAM531qKt7eizrxJxQcpqdGUNpoUfpJCz+Qg2FpfLnhFL51Nu8g0sRn
 4osxuUDcE/nldN5pbe3HFwXVtGSu6f1LvgezVbTGqQ==
X-Google-Smtp-Source: ABdhPJwJdLuhTmLM1sAkCD1ZUwA3O1OfcfJESjTRieFzCIvosW4mzYhx+MOJVTCdWblyz/gBvfFcbYY73xTNZt3LZOw=
X-Received: by 2002:a05:6808:1296:b0:325:8fb:68f3 with SMTP id
 a22-20020a056808129600b0032508fb68f3mr5575460oiw.193.1650929788965; Mon, 25
 Apr 2022 16:36:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 16:36:28 -0700
MIME-Version: 1.0
In-Reply-To: <1650924663-24892-2-git-send-email-quic_khsieh@quicinc.com>
References: <1650924663-24892-1-git-send-email-quic_khsieh@quicinc.com>
 <1650924663-24892-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 25 Apr 2022 16:36:28 -0700
Message-ID: <CAE-0n51djgvHx=1CTRUnzeQ2deAPSXFPobET==A4P5N1HTvMaQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 1/2] drm/msm/dp: reset DP controller
 before transmit phy test pattern
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-04-25 15:11:02)
> DP controller state can not switch from video ready state to
> transmit phy pattern state at run time. DP mainlink has to be
> teared down followed by reset controller to default state to have
> DP controller switch to transmit phy test pattern state and start
> generate specified phy test pattern to sinker once main link setup
> again.
>
> Fixes: ee35444be0c8 ("drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run")

What commit is this? I think it's supposed to be

Fixes: 52352fe2f866 ("drm/msm/dp: use dp_ctrl_off_link_stream during
PHY compliance test run")

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Otherwise,

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
