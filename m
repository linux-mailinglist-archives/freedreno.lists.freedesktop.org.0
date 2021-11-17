Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E425F4540FD
	for <lists+freedreno@lfdr.de>; Wed, 17 Nov 2021 07:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DD689E69;
	Wed, 17 Nov 2021 06:40:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0855589E69
 for <freedreno@lists.freedesktop.org>; Wed, 17 Nov 2021 06:40:15 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id 7so4153566oip.12
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 22:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=sTIAMjYbIgPw9BtP6BK0EtEhZfFJG39339XpbTQz4q8=;
 b=A0tibesQgJVPgiCl6aeIuALbSS6lrs8f6fPC/c+D8Wf1ORiIDWJ+s1ln7Shzh1GpRD
 ro3/eplCp9UgHmCgISTLEFDSSv+2L/qNZBmCOztatF3fMnZQRQs/fCX/uDFgzO+5BbFn
 7jbYp3FaKRjgdElxiI9IpgGIo3racyC4WLSiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=sTIAMjYbIgPw9BtP6BK0EtEhZfFJG39339XpbTQz4q8=;
 b=r/9rjONeJHBUZIoYc92TqSXeDW0aeqha6SQDDG/7+NxWCJIG1+Kki4SSLL3FXVIDJk
 covK48BTn59zQuPouEVJJmi6XG+/U2jJywKhacdgkByi+GHfq5pE8Vmv6Lq6mew5Mscg
 sJsx0CiuGYoJsnKWYZFg1rRD3C7jDalKg7rlyiW63uXiNOqUDTGU/jze1gMkW/TcY1W4
 LqFUuIY5EJTFmEVxEMW/yGyd61cltZo4AGfqZqVYE04XhqoFskeJS4jis40458PMWV7d
 2WPNvkfqVllTFj77IEo9W6P1Nk7qvn1CA/d9JNbLkFH3UlWtKyJRtd4Dz7yho20CMhdb
 xAdg==
X-Gm-Message-State: AOAM533eOUhCHxQ9rbl/Cp3r9/1+36LhGOtTaQRF2nC9RzFlHTlEkeLj
 kQqKGzJXkNUYWqVsipgM9XQx+uFy6c84Qq7LfU6kkA==
X-Google-Smtp-Source: ABdhPJwL9sejHW2saSeYc0Y8yMtZq0mvyD1HM5tD4KfGOegNHF0M+D7BAXpiycc0GG7yCK/vgooZobtV5T5yDPezdgU=
X-Received: by 2002:a54:4506:: with SMTP id l6mr58766242oil.32.1637131214191; 
 Tue, 16 Nov 2021 22:40:14 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:40:13 -0800
MIME-Version: 1.0
In-Reply-To: <88a5219e-c82a-87fa-6af3-578238d6027b@quicinc.com>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
 <88a5219e-c82a-87fa-6af3-578238d6027b@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:40:13 -0800
Message-ID: <CAE-0n53cbEAXgE6+9b+pqxGFayhB-2evhnzQatfoCc2h1r5VmA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, robdclark@gmail.com, robh+dt@kernel.org, 
 sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH v3] arm64: dts: qcom: sc7280: Add Display
 Port node
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
 Kuogee Hsieh <khsieh@codeaurora.org>, quic_mkrishn@quicinc.com,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org,
 quic_kalyant@quicinc.coml
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-11-16 08:43:38)
>
> On 11/15/2021 3:39 PM, Stephen Boyd wrote:
>
>     Quoting Kuogee Hsieh (2021-11-02 16:44:33)
>
>         From: Kuogee Hsieh <khsieh@codeaurora.org>
>
>         Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>         ---
>
>     What tree is this based on? I don't see edp_phy upstream for sc7280
>
> this patch is depend on=C2=A0 --> [PATCH v2 4/4] arm64: dts: qcom: sc7280=
: add edp
> display dt nodes
>
> it had completed reviewed.
>
> https://mail.codeaurora.org/?_task=3Dmail&_caps=3D
> pdf%3D1%2Cflash%3D0%2Ctiff%3D0%2Cwebp%3D1&_uid=3D1789&_mbox=3DINBOX&_acti=
on=3Dshow
>

That email link doesn't work for anyone besides you.
