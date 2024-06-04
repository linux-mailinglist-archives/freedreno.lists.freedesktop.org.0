Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678328FB6BC
	for <lists+freedreno@lfdr.de>; Tue,  4 Jun 2024 17:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D0710E3C0;
	Tue,  4 Jun 2024 15:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zluzdtQs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E2310E23C
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jun 2024 15:14:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b9dda4906so2401624e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jun 2024 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717514086; x=1718118886; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EWiHpLew9vGqorYtx7ts5j6e/3RBM+m1gRe0g/Bu3FA=;
 b=zluzdtQscf5ebIeV9Ath4StafdJxNSkaG/aeD8uqF9iNQ4FsTFm/aiix+Gt4RN0AK3
 2iTTtDqg6HxeWqR1o4uPqkOVgveIc3hofWmqML0wE6SRhhNAOU+Q2qoqP5FxW/blIA1m
 lbpr/QLHNY6EyuTKkilANINUieZkZuQ+jCg0PWzEec91+wsCRxCh5I7EzG2tiWzp/x/i
 +/WedduUg9y5c5Z+eRk+j+WQ3rHpEveg7dEvSRRqcwoamS9EcNF0vMimzN/V4KzquBjo
 N7d33Okji8HybDJyAa1MUnhdrGsCMYJ+qGblB1fDxlWSibE4x77sjpFEuIpu8gIGzxVt
 xg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717514086; x=1718118886;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EWiHpLew9vGqorYtx7ts5j6e/3RBM+m1gRe0g/Bu3FA=;
 b=j+RcUDtLebWMZtM5Ucm0D7NyN81eksAPXheMC6qp0cRW7g+Re4CdrubYgjCnXn3Umn
 YAlQOaPm05WXQk/9xjZ5JLET3FS5JSZT1onAWfsSLiSvu/QouWopsiONhT+6LfilsoHJ
 gh4Cy11hcyYX2GnZrHyWxuwxmqwC8G1mlSDYrjtac1Il1dzxbaplbaPo3+QcvPJp/mWD
 HtQ6KqbIt37g8Wum3avn4aupeZP2iI4MhLFMJn53q8zFKs6TgDJgxc7lSePBTJDPBGWl
 KCOHEnHv2rD4CCrfkqGbitpmsBOEFTp1V36zp5YMEIWiILcKF5OFb07t92oNkei9Mhwl
 buWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP44JwuSN3d/gkn0+VojngRvR0QERKjy9wENQcxlXGIh7QRkpMq+uwt30PcgmjT8f514xKe09gljPX3gbJBDg69ldlXJF6VQO+Z5LMSlNK
X-Gm-Message-State: AOJu0YwUnJgdg7IPkES+ryYDZDzgPKZLzA4msDnJ2yosnilInaE/grW+
 BScONLgLXfWMT9ljwTymzP50sDfnwV/kK1YzBtHZOpCPVrJQoEXmQSO1pRTxT6E=
X-Google-Smtp-Source: AGHT+IHm+hB/6mNiZerSwvoXhE+7cXjeasN8XmPyjTFGT5CHDOB7i12qXaNe0UACZFPBgbH5sCq09g==
X-Received: by 2002:a05:6512:5d0:b0:524:652e:1696 with SMTP id
 2adb3069b0e04-52b896cac46mr8566501e87.60.1717514086137; 
 Tue, 04 Jun 2024 08:14:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d873b9sm1513803e87.229.2024.06.04.08.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 08:14:45 -0700 (PDT)
Date: Tue, 4 Jun 2024 18:14:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display/msm/dsi: allow specifying TE
 source
Message-ID: <tymwexyhuujgrz2cvxkruimst3ff4mnevcm2k4h6qdmpmb7yqp@zqbwwc5t66ya>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-1-f273b42a089c@linaro.org>
 <224fa477-07ba-e7b2-2f7d-8f7d21f4a0c7@quicinc.com>
 <CAA8EJpp8kRPKboHNHwD+R5f1AcndjaQdGG=Q4ygmRE9VMNievQ@mail.gmail.com>
 <5cde2f43-89ab-d2d4-d68e-605f8f5d1da7@quicinc.com>
 <CAA8EJpoMtr6OGjL8qq-cHadQSOVyDAaL8=2TLvOjBbYV2Z7+Mg@mail.gmail.com>
 <d1a9be5d-b0a0-73bc-c66f-6d45049fbaf1@quicinc.com>
 <CAA8EJppFZQTghtyweGG_8zSqqZpEp=ho0bXuRxgyU2qGL4+ppA@mail.gmail.com>
 <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b604c91-7b1f-46b3-6b41-fe7d45190b78@quicinc.com>
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

On Wed, May 29, 2024 at 06:08:21PM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/29/2024 5:02 PM, Dmitry Baryshkov wrote:
> > On Thu, 30 May 2024 at 00:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 5/23/2024 2:58 AM, Dmitry Baryshkov wrote:
> > > > On Thu, 23 May 2024 at 02:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 5/22/2024 1:05 PM, Dmitry Baryshkov wrote:
> > > > > > On Wed, 22 May 2024 at 21:38, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > > > > > > 
> > > > > > > >          required:
> > > > > > > >            - port@0
> > > > > > > >            - port@1
> > > > > > > > @@ -452,6 +467,7 @@ examples:
> > > > > > > >                                dsi0_out: endpoint {
> > > > > > > >                                         remote-endpoint = <&sn65dsi86_in>;
> > > > > > > >                                         data-lanes = <0 1 2 3>;
> > > > > > > > +                                   qcom,te-source = "mdp_gpio2";
> > > > > > > 
> > > > > > > I have a basic doubt on this. Should te-source should be in the input
> > > > > > > port or the output one for the controller? Because TE is an input to the
> > > > > > > DSI. And if the source is watchdog timer then it aligns even more as a
> > > > > > > property of the input endpoint.
> > > > > > 
> > > > > > I don't really want to split this. Both data-lanes and te-source are
> > > > > > properties of the link between the DSI and panel. You can not really
> > > > > > say which side has which property.
> > > > > > 
> > > > > 
> > > > > TE is an input to the DSI from the panel. Between input and output port,
> > > > > I think it belongs more to the input port.
> > > > 
> > > > Technically we don't have in/out ports. There are two ports which
> > > > define a link between two instances. For example, if the panel
> > > > supports getting information through DCS commands, then "panel input"
> > > > also becomes "panel output".
> > > > 
> > > 
> > > The ports are labeled dsi0_in and dsi0_out. Putting te source in
> > > dsi0_out really looks very confusing to me.
> > 
> > dsi0_in is a port that connects DSI and DPU, so we should not be
> > putting panel-related data there.
> > 
> 
> Yes, true. But here we are using the "out" port which like you mentioned is
> not logical either. Thats why I am not convinced or not sure if this is the
> right way to model this.
> 
> > I see two ports: mdss_dsi0_out and panel_in. Neither of them is
> > logical from this point of view. The TE source likewise isn't an input
> > to the panel, so we should not be using the panel_in port.
> > 
> 
> > > 
> > > > > 
> > > > > I didnt follow why this is a link property. Sorry , I didnt follow the
> > > > > split part.
> > > > 
> > > > There is a link between the DSI host and the panel. I don't want to
> > > > end up in a situation when the properties of the link are split
> > > > between two different nodes.
> > > > 
> > > 
> > > It really depends on what the property denotes. I do not think this
> > > should be the reason to do it this way.
> > 
> > It denotes how the panel signals DPU that it finished processing the
> > data (please excuse me for possibly inaccurate description). However
> > there is no direct link between the panel and the DPU. So we should be
> > using a link between DSI host and the panel.
> > 
> 
> Yes, I totally agree that we should be using a link between DSI host and the
> panel.
> 
> My question from the beginning has been why the output port?
> 
> It looks like to me we need to have another input port to the controller
> then?
> 
> One from DPU and the other from panel?

Dear DT maintainers, could you please comment on the OF graph entries?
Are they considered to be unidirectional or bidirectional?

Would you suggest adding another arc to the OF graph in our case or is
it fine to have a signal generated by the panel in the 'panel_in' port?


> 
> > > 
> > > > > 
> > > > > If we are unsure about input vs output port, do you think its better we
> > > > > make it a property of the main dsi node instead?
> > > > 
> > > > No, it's not a property of the DSI node at all. If the vendor rewires
> > > > the panel GPIOs or (just for example regulators), it has nothing to do
> > > > with the DSI host.
> > 

-- 
With best wishes
Dmitry
