Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876F421B70
	for <lists+freedreno@lfdr.de>; Tue,  5 Oct 2021 03:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F0E6EAD3;
	Tue,  5 Oct 2021 01:09:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093796EAD3
 for <freedreno@lists.freedesktop.org>; Tue,  5 Oct 2021 01:09:29 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id s69so23965296oie.13
 for <freedreno@lists.freedesktop.org>; Mon, 04 Oct 2021 18:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PfzHBiZhKUhn0s0eLjPcHLmx5o0gtPl/KN/s/msn4zM=;
 b=UPGDqOoPD5Eh60p491rq2NQMsh4XnIw1wAOTdP0paZzAaQv8En+zQ2zpU2+6CL4cTm
 Ex1LvjY7TUhB2wJtQxG8ueeaEIWMgl/+KV4Iuqn2dgTupDBZTzvEIko/CKojD7oY60T4
 cbcK7ocjBLyoV2H2tWPyOfzoryyW3Z3wK1N0lKj7c7pc7hilvFJKGiBxn9Kk4sR9pwMb
 WU+1QjXcsofiJUSMlIXvNcnx0bxf+xVB1XaDn1+VfgZNwCagNff21+KeDI5TTbBZZi5O
 VBGPFITZXfuWe3hzR8rLLatoLKOvMg3cfHfkR+Xibf3FOySpRIOJIBqlfo1kCZbjVJaA
 /m7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PfzHBiZhKUhn0s0eLjPcHLmx5o0gtPl/KN/s/msn4zM=;
 b=rifxSfvAu4XmQgRk3t11l4cJQhw7ubKSjfoCEudiyVYV7SQCZmPIMqo4omene1fORp
 xeF884NIAvA/721Ca7zdUDqeRLRIXdQjvBlEtnbQdnGjJaaZb07VKAZBngm5oJAkIUPr
 3emcOEIS55hnrswXPeARUKmVM7CQNTOqgurd8gEJLcKzJf7WPb/JHveVXrPA0pXU1fPY
 XHaJkmmKPv7kq52MpHsOrpPFQ0HZYexJSnq8xzalyZYosWyVNLlivfMxMZDXVmx2P6gx
 T4s89TDVVb1DStaxuMIM1IJDTRQZuJQevQ+PwnFGWffvtkzVvlsK4iG/WH5y5+jRKt4B
 tb9A==
X-Gm-Message-State: AOAM532vdj5A1iMflC4Qw6zJAXqbV90fdja2n5K64lXdlS6y7S5cD3fq
 BPD5AJq3uou9n4EoWvYEBm2MvQ==
X-Google-Smtp-Source: ABdhPJwKzjmahegi6IWvBf6fZZ5e+Ec70JOrpzbbtjQScKuhAGhYciMj1L2+D+rpPLsMLeb9LMeCHA==
X-Received: by 2002:aca:1706:: with SMTP id j6mr232425oii.57.1633396168224;
 Mon, 04 Oct 2021 18:09:28 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id o26sm3174520oof.32.2021.10.04.18.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 18:09:27 -0700 (PDT)
Date: Mon, 4 Oct 2021 18:11:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <khsieh@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vara Reddy <varar@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
Message-ID: <YVumL1lHLqtb/HKS@ripper>
References: <20210726231351.655302-1-bjorn.andersson@linaro.org>
 <CAD=FV=UGtHXD==Yy8CVCOioYGb=2hqGQOoNWftD1Jj7OiEp51g@mail.gmail.com>
 <YVd3YdfgFVc0Br5T@ripper>
 <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=U=xVLuKOYHbGPTkLjGa8_U+F1ZtEvJt4LGaRuR5SsKFw@mail.gmail.com>
Subject: Re: [Freedreno] [RFC] drm/msm/dp: Allow attaching a drm_panel
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

On Mon 04 Oct 17:36 PDT 2021, Doug Anderson wrote:

> Hi,
> 
> On Fri, Oct 1, 2021 at 2:00 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Fri 27 Aug 13:52 PDT 2021, Doug Anderson wrote:
> >
> > > Hi,
> > >
> > > On Mon, Jul 26, 2021 at 4:15 PM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > +static int dp_parser_find_panel(struct dp_parser *parser)
> > > > +{
> > > > +       struct device_node *np = parser->pdev->dev.of_node;
> > > > +       int rc;
> > > > +
> > > > +       rc = drm_of_find_panel_or_bridge(np, 2, 0, &parser->drm_panel, NULL);
> > >
> > > Why port 2? Shouldn't this just be port 1 always? The yaml says that
> > > port 1 is "Output endpoint of the controller". We should just use port
> > > 1 here, right?
> > >
> >
> > Finally got back to this, changed it to 1 and figured out why I left it
> > at 2.
> >
> > drm_of_find_panel_or_bridge() on a DP controller will find the of_graph
> > reference to the USB-C controller, scan through the registered panels
> > and conclude that the of_node of the USB-C controller isn't a registered
> > panel and return -EPROBE_DEFER.
> 
> I'm confused, but maybe it would help if I could see something
> concrete. Is there a specific board this was happening on?
> 

Right, let's make this more concrete with a snippet from the actual
SC8180x DT.

> Under the DP node in the device tree I expect:
> 
> ports {
>   port@1 {
>     reg = <1>;
>     edp_out: endpoint {
>       remote-endpoint = <&edp_panel_in>;
>     };
>   };
> };
> 

/* We got a panel */
panel {
    ...
    ports {
        port {
            auo_b133han05_in: endpoint {
                remote-endpoint = <&mdss_edp_out>;
            };
        };
    };
};

/* And a 2-port USB-C controller */
type-c-controller {
    ...
    connector@0 {
        ports {
            port@0 {
                reg = <0>;
                ucsi_port_0_dp: endpoint {
                    remote-endpoint = <&dp0_mode>;
                };
            };

            port@1 {
                reg = <1>;
                ucsi_port_0_switch: endpoint {
                    remote-endpoint = <&primary_qmp_phy>;
                };
            };
        };
    };

	connector@1 {
        ports {
            port@0 {
                reg = <0>;
                ucsi_port_1_dp: endpoint {
                    remote-endpoint = <&dp1_mode>;
                };
            };

            port@1 {
                reg = <1>;
                ucsi_port_1_switch: endpoint {
                    remote-endpoint = <&second_qmp_phy>;
                };
            };
        };
	};
};

/* And then our 2 DP and single eDP controllers */
&mdss_dp0 {
    ports {
        port@1 {
            reg = <1>;
            dp0_mode: endpoint {
                remote-endpoint = <&ucsi_port_0_dp>;
            };
        };
    };
};

&mdss_dp1 {
    ports {
        port@1 {
            reg = <1>;
            dp1_mode: endpoint {
                remote-endpoint = <&ucsi_port_1_dp>;
            };
        };
    };
};

&mdss_edp {
    ports {
        port@1 {
            reg = <1>;
            mdss_edp_out: endpoint {
                remote-endpoint = <&auo_b133han05_in>;
            };
        };
    };
};

> If you have "port@1" pointing to a USB-C controller but this instance
> of the DP controller is actually hooked up straight to a panel then
> you should simply delete the "port@1" that points to the typeC and
> replace it with one that points to a panel, right?
> 

As you can see, port 1 on &mdss_dp0 and &mdss_dp1 points to the two UCSI
connectors and the eDP points to the panel, exactly like we agreed.

So now I call:
    drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);

which for the two DP nodes will pass respective UCSI connector to
drm_find_panel() and get EPROBE_DEFER back - because they are not on
panel_list.

There's nothing indicating in the of_graph that the USB connectors
aren't panels (or bridges), so I don't see a way to distinguish the two
types remotes.

Hope that clarifies my conundrum.

Regards,
Bjorn
