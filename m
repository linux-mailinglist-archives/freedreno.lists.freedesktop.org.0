Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 843B51FD591
	for <lists+freedreno@lfdr.de>; Wed, 17 Jun 2020 21:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064056E145;
	Wed, 17 Jun 2020 19:52:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BD16E145
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 19:52:53 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id h22so1580281pjf.1
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jun 2020 12:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=LQsBfLuHQnXebs8tzUx0QZBobI6Ci5amH7vvKmW561c=;
 b=inVPy6Ehzcbr6FMktQ9CscKqG1doUmPe8FrnEKF0cVTb6589k12gpmi0AgjKifH7Sv
 M/DNoIl+ecZcJTAkS/5cwcxZxR+ha44f7/BQKoOYcrPMS3XRO5WP5gQhIfYAi/ODkZfy
 UG4FBXOf0RIrDWQgAHk2N4sP9zsAJhSMWYqrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=LQsBfLuHQnXebs8tzUx0QZBobI6Ci5amH7vvKmW561c=;
 b=OFkLb+Y4DxzPkWkLWaiIPGaIRsNa6Hv0FJBpf23nBNH/NsrZXGOY5Ut6cXX/a9+r+T
 c0YGt4nwfEG6BiOkpaWfBhhwvVChh3cAN1/K1U6buIoCXARIe1I04/OQM0EJRCpkWkYt
 gugpnA9tl9JvMlIfn4lQoXhmAjAniUT2MzJVrE4AKPyQNtf5Y3AM8wWGzTGuKgqq+q9g
 bqZ1zXTz2WqVqhtlZwtof/CUJ15CjyooNCG48byKPfWmOWusftwNRdV1PpeOoYvt3loZ
 fDBBCSumT8BIbmHfxfob2qQM1AdXc2W2978rt0G2iOh2dJnRFD3ijI0IzKQDDND1x0jn
 q8ag==
X-Gm-Message-State: AOAM530dXlPIVmn7DTW92C/aQ5Rx6DmLftZsDl6FJFyC2PobcmgBmWsn
 9zTvqDlwWsA38PPzWOxbxj0alXmaGho=
X-Google-Smtp-Source: ABdhPJwJUycm8yXEm5q4JlYs31av1QS4bD6y+lVigYkxB8za+MHnq+pjRLRvt0SqgjrtnPemqxALvA==
X-Received: by 2002:a17:90a:7785:: with SMTP id v5mr681689pjk.31.1592423573026; 
 Wed, 17 Jun 2020 12:52:53 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id i3sm355161pjv.1.2020.06.17.12.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 12:52:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <20200612015030.16072-2-tanmay@codeaurora.org>
 <159230611219.62212.8262135380349283774@swboyd.mtv.corp.google.com>
 <CAL_JsqLsp6gR_=nA36usk67n7+EJOoxt-87R5zc1_DXpap5cag@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Date: Wed, 17 Jun 2020 12:52:51 -0700
Message-ID: <159242357167.62212.6568995439730589763@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [PATCH v6 1/5] dt-bindings: msm/dp: add bindings of
 DP/DP-PLL driver for Snapdragon
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
Cc: devicetree@vger.kernel.org, aravindh@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Vara Reddy <varar@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Rob Herring (2020-06-17 08:38:20)
> On Tue, Jun 16, 2020 at 5:15 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Tanmay Shah (2020-06-11 18:50:26)
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > > new file mode 100644
> > > index 000000000000..5fdb9153df00
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/msm/dp-sc7180.yaml
> > > @@ -0,0 +1,142 @@
> > > +        data-lanes = <0 1>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +                dp_in: endpoint {
> > > +                    remote-endpoint = <&dpu_intf0_out>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                dp_out: endpoint {
> >
> > Just curious what is eventually connected here? This is possibly a
> > question for Rob Herring, but I can't figure out how we're supposed to
> > connect this to the USB type-c connector that is receiving the DP
> > signal. Does the type-c connector binding support connecting to this end
> > of the graph? Or should this connect to the DP phy and then the phy
> > connects to the USB type-c connector node? Right now it is empty which
> > seems wrong.
> 
> It should connect to the Type-C connector perhaps thru some sort of
> switching/muxing node, but that's not really flushed out though. See
> 'dt-bindings: chrome: Add cros-ec-typec mux props' discussion with
> your CrOS colleagues.
> 

Ok. I see that we have an sbu endpoint for an aux channel but not a DP
endpoint in the type-c connector. I guess it's an alternate mode of the
connector too so maybe that complicates things. I'll talk to pmalani.
Thanks.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
