Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163A064E234
	for <lists+freedreno@lfdr.de>; Thu, 15 Dec 2022 21:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B35B610E558;
	Thu, 15 Dec 2022 20:12:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4472610E558
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 20:12:34 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id s25so138034lji.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Dec 2022 12:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ma29jYxLICPfJYdRmS8iS0Sz2Ww6x0xzpK34aJyoY38=;
 b=WAMocIyQLya3cZ3eoRREWyL3BJuNCw4hHzTN4zu8lxDR5ZNKjTqCzsxYDNl+EGJJam
 gwjij75zZhMjukUfT79v+h+7g9RMduI6pfuM5dCQ9kFJGj914ZIi+iCdEMUkSEN3iKvZ
 Kjh0w0DYmCEhqLYN6dcPY+roorUbtIZ7LGas8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:user-agent
 :from:references:in-reply-to:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ma29jYxLICPfJYdRmS8iS0Sz2Ww6x0xzpK34aJyoY38=;
 b=tGS566TTl9br9Fmf21Ip5t4HV5IbocmCgzIDJ4u5gvIs6/24fzlWaDBYCpKv0lr6ia
 Yff+m3VRiHw/6FdErbXre5ghWioij7gnOyxAonZ/jeQqN6NFkSNoR7PRWT2/v/CfdPBM
 aBM9Fukl++wsiFVKf+YOClv0EJHJNYbLIelWApeQLGli6pVAi3QoXTpIcIQm4nI46eWD
 WybsdnKl0Rj92l6aNz34gmQPGldVxVIB1ytEvX0PkyHl6FEE4EPETMpE+Hbwn22zq63e
 X0OW7WlXBxpsXjF7HGPc+9LfFvQ2GybYA/TGd+8Glmwsi3zgaOG98laGXvcS549C/xPO
 vOKQ==
X-Gm-Message-State: AFqh2kq2ZkBhFqG7Mm16yDUb2P2M/615SbDkFNMdOkizDzNL6E+G27yi
 ocoX7mI/22g52gfWTnVSuKgqOZ95sAZqqwNYpNWesw==
X-Google-Smtp-Source: AMrXdXt3ybfdYsbW+NzMUL4sJXmfO6ubzbiioxX2yF9TmOb2VxGIBXIKmk+OiSkMyH6erDrmmUsl31yNVnS26c1UhTo=
X-Received: by 2002:a05:651c:3c7:b0:27d:75b3:8fd0 with SMTP id
 f7-20020a05651c03c700b0027d75b38fd0mr510146ljp.39.1671135152456; Thu, 15 Dec
 2022 12:12:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Dec 2022 15:12:31 -0500
MIME-Version: 1.0
In-Reply-To: <98cc6d55-f9c7-a369-6004-42b242d01339@quicinc.com>
References: <1670967848-31475-1-git-send-email-quic_khsieh@quicinc.com>
 <1670967848-31475-3-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n52eHYCqxUJqQXoaQ8vyqCk-QfouSun+zUp3yo5DufWbwg@mail.gmail.com>
 <b38af164-08bc-07e7-dfaf-fb4d6d89d7db@quicinc.com>
 <CAE-0n53Cb6TFGfM6AYup5aP4=24j0ujVPi463oVqmzfNV2B4RA@mail.gmail.com>
 <98cc6d55-f9c7-a369-6004-42b242d01339@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 15 Dec 2022 15:12:31 -0500
Message-ID: <CAE-0n52j8vYYTRSpBo82MHqLiSjxikL=2P6NQwa0-DW__sc6WA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, devicetree@vger.kernel.org, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org, 
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v12 2/5] dt-bindings: msm/dp: add data-lanes
 and link-frequencies property
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-12-15 09:08:04)
>
> On 12/14/2022 4:38 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-12-14 14:56:23)
> >> On 12/13/2022 3:06 PM, Stephen Boyd wrote:
> >>> Quoting Kuogee Hsieh (2022-12-13 13:44:05)
> >
> >> Therefore I think add data-lanes and link-frequencies properties in th=
e
> >> DP PHY binding directly will not helps.
> >>
> > I didn't follow your logic. Sorry.
>
> Sorry, probably i did not understand your proposal clearly.
>
> 1) move both data-lanes and link-frequencies property from dp controller
> endpoint to phy
>
> 2) phy_configure() return succeed if both data-lanes and link
> frequencies are supported. otherwise return failed.
>
> is above two summary items correct?

Yes.

>
> Currently phy_configure()=C2=A0 is part of link training process and call=
ed
> if link lanes or rate changes.
>
> however, since current phy_configure() implementation always return 0,
> the return value is not checking.
>
> This proposal is new, can we discuss more detail at meeting and decide
> to implement it or not.
>
> Meanwhile can we merge current implementation (both data-lanes and
> link-frequqncies at dp controller end point) first?
>

I don't think we can merge this patch because it depends on a DT binding
change. If the PHY approach works then I'd prefer we just go with that.
