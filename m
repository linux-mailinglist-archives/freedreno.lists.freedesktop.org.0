Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7C38CFE5
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 23:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C03B6E87F;
	Fri, 21 May 2021 21:29:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA106E87F
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 21:29:20 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 j17-20020a4ad6d10000b02901fef5280522so4906847oot.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zwLYpS9p+8pJmcHuXNBolppRUtNsTbIPmp+o6UQN8KY=;
 b=QtSBZYDh6GXubEPHb5E6TM+CGkEttGlt5INDzQJsT5WtE/0MFFvJhO7gbj3+Q4VeqP
 Gra4TjrLaTsgPaETf4ffiTizTTRX6QPUdE9WKtw9XQoyJ6h70L7k1R6T81ghVNTBziD7
 R3uada59gAbc3/ENK6NowtwkdkjnmhqV9mfXemPzQJzZDnM7lBSpB/4csFqbGTLhO+Xx
 LxCryxs3M7PUB1zri84mcdXv5MDouCR5BQ0ymA5H2+N7NhciVn0NdFe8GY0fT2Karlmq
 ysO9amHItoswmTqNRVDqi2LLuIWx8bhO6LQHf6iz32OyhKvY5PzoYvlD/hZtNaNE07ij
 BPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zwLYpS9p+8pJmcHuXNBolppRUtNsTbIPmp+o6UQN8KY=;
 b=QbUNMm/koGcEP7xxO4djh83Q2s3HnyU698BW1E5D3sxk1sytEW4PsNlszFqwxr0KZh
 dlwoZJoe81k7OejpVdmuGdXqw7stU8Jb2ykEX3R00zzje8eARJ/dp547LFdhUj+B2UX1
 UtARJrO0PK3EF+2HSfqNM9krC7LycRkosMa01HM9R9ezVTtsigM59derwg8CDAec+pOy
 9zFlezJvSb6g1fcYUS2bMuYEmq/EhlV2OmZOXCqLe8xa4uHmTeFHvgxdDm99ELe4Ln+N
 XlsLpW4cZSNmbK3hYNU3x/7qHCFuWunRqHJWKI5lQ78gDReXXHPTzmAI+tDlG7o4Dx9+
 k1CQ==
X-Gm-Message-State: AOAM531J0Vm3f75zrQLQopaV24+RnWW/n4sDLYmXTYEDN5QBrHoTZSp6
 VA5kcaIrWQDt9e+5Gfke4AX4YA==
X-Google-Smtp-Source: ABdhPJz3VBmFLhgkEFqyEA6f6S120M4rxSxkrTuWLk6tRMZx5/wC8POdyrzrinnm98ZUs5b0qJv3/A==
X-Received: by 2002:a4a:4581:: with SMTP id y123mr9685400ooa.33.1621632559601; 
 Fri, 21 May 2021 14:29:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x31sm1531434ota.24.2021.05.21.14.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 14:29:19 -0700 (PDT)
Date: Fri, 21 May 2021 16:29:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Message-ID: <20210521212916.GG2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <20210521160029.GA2484@yoga>
 <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE-0n53y2_icuPf+j8hd1hGyWRbD2V0Fye+aGSe0M9zku_0DOA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v17 1/4] dt-bindings: msm: disp: add yaml
 schemas for DPU bindings
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
Cc: sean@poorly.run, Krishna Manikandan <mkrishn@codeaurora.org>,
 vinod.koul@linaro.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, abhinavk@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, khsieh@codeaurora.org, robdclark@gmail.com,
 robh+dt@kernel.org, tanmay@codeaurora.org, kalyan_t@codeaurora.org,
 freedreno@lists.freedesktop.org, robh@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 21 May 15:51 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-05-21 09:00:29)
> > On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
> > [..]
> > > +      ports:
> > > +        $ref: /schemas/graph.yaml#/properties/ports
> > > +        description: |
> > > +          Contains the list of output ports from DPU device. These ports
> > > +          connect to interfaces that are external to the DPU hardware,
> > > +          such as DSI, DP etc. Each output port contains an endpoint that
> > > +          describes how it is connected to an external interface.
> > > +
> > > +        properties:
> > > +          port@0:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: DPU_INTF1 (DSI1)
> > > +
> > > +          port@2:
> > > +            $ref: /schemas/graph.yaml#/properties/port
> > > +            description: DPU_INTF0 (DP)
> >
> > Why is port@0 INTF1 and why is port@2 INTF0? In the binding you're
> > translating the two ports that are described are 0 and 1, representing
> > INTF1 and INTF2, or DSI1 and DSI2, respectively.
> >
> > Further more, I have a need for somehow describing the pairing of 4 DP
> > INTFs (INTF 0, 3, 4 and 5) and how they are connected to the 3+1 DP+eDP
> > controllers.
> >
> > Downstream this seems to be handled by adding cell-index to the DP
> > controllers and then matching that against the numbering in the driver's
> > INTF array. But rather than adding cell-index to map this, can't we
> > define that the port index is the INTF-number here?
> >
> >
> > This would obviously break compatibility with existing DTBs, but we
> > could start by doing it selectively for the new compatibles, fix up the
> > existing dts files and then drop the selective application after 1 or 2
> > LTS releases.
> 
> I requested that the existing DT not change a while ago when the DP
> interface was being added to this binding. Is it possible to figure out
> what interface it is that the port is for from the binding? It feels
> like the problem is that the driver wants to look through the graph and
> make connectors for each one, but it doesn't know what type of connector
> to make.

Today there's a single priv->dp pointer which is initialized as the one
and only displayport controller component is bound.
_dpu_kms_set_encoder_mode() has no knowledge about which interface this
single controller is attached to, so dpu_encoder_setup_display() will
always just pick INTF_DP index 0.

So in its current form if your single DP port isn't sitting on the
platform's first DP INTF you need to hack dpu_hw_catalog and remove the
previous ones.

But with my desire to reuse the DP controller code for eDP, and the fact
that I have 3 DP controllers in my laptop we need something more.

But after considering my proposal further I realized that it is too
static for my use case anyway. SC8180x has INTF 0 and 4 are wired to
the DP controllers associated with the two primary USB ports and then
INTF 3 is dynamically switched between them for MST purposes.

So using port indices would prevent me from doing this dynamic dance.

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
