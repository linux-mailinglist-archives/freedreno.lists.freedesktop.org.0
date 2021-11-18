Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A5B45523E
	for <lists+freedreno@lfdr.de>; Thu, 18 Nov 2021 02:33:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B396E151;
	Thu, 18 Nov 2021 01:33:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8B76E151
 for <freedreno@lists.freedesktop.org>; Thu, 18 Nov 2021 01:33:52 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso8028749otj.11
 for <freedreno@lists.freedesktop.org>; Wed, 17 Nov 2021 17:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=4b4P2TJUsQmMD7ulO5jskW7J+R4EF/1H7E16Fc7M+tk=;
 b=lwE1jNkaQ6vRIYJfuDg1xVkUFcf6I9dfnMdqvFzcLVB9aZRng6kzelTHzd9M2GegQt
 G+F6eYa/CXyot083R2bqXE1ZITf+EOHFfCrAuPGKm/iEJlaxBPzElDYHm+wER3E6nXcv
 QqgCD+3QH3rqwWIYqnDlyqizIZB5ODklXHB1yl8yC6wzlvc85IfV/gHa3pF6niOkuPOg
 HxMcizZ2Ly8ANIpX0OR0kYfl6gDnFmnCMPC947Qy90+zQ8QQMVjy1EhgvgLtTeaMoSgo
 VYorYBk3LxsAqqIAPOzJccXh6uOrl33XCXnN9hkWcP+AhMTXGa4aeeXa+9V73FGNO9bi
 PRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=4b4P2TJUsQmMD7ulO5jskW7J+R4EF/1H7E16Fc7M+tk=;
 b=Ev6VzWKf3R35jDOK9nLvtBFrO7pxHM/A7ljJyRX45Pn5kPRb8IwfI7cgnP3rJUcxrp
 RFxnUQIqQKQv/1Ua7oMTXXHRPKXfma+UkNPxIcmPtk9vsKocyMAexiVUuworJSnQxENi
 kRRlK2tS4xxb/Y0qoMVGedKRIaikrF7otAJRWbC3HfJZw4SpBUgS9xdDti+cxwc1i+md
 riC6rW+r5ugE8mvGuEwCE+dBwuKXKFjUtYEoF2WRFREtEKxkB+XlIu1OyPYITnOin/5C
 lc2bLspyacNJvZVnHzmcF60FPBNdzLkqMIb+V+M1vs4bcJJ3LcYfnxIHiwvTuyTdPYvW
 QwlA==
X-Gm-Message-State: AOAM531qhhxtVCEWpHx7Pwr72F42To7UCP3ZT43Lj01/wqO0wSJdmGES
 CmqzJqiKZTLP8/JUq6OfRk5jFQ==
X-Google-Smtp-Source: ABdhPJyAP0uCLZL43+mhZCRInEmazFHlxnQ7X8cjmMuZqDA2VCVNiYRJvwQ9Jffhy6a/v8ncNhEAsA==
X-Received: by 2002:a05:6830:1358:: with SMTP id
 r24mr18065620otq.8.1637199231021; 
 Wed, 17 Nov 2021 17:33:51 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id t14sm329745oth.81.2021.11.17.17.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 17:33:50 -0800 (PST)
Date: Wed, 17 Nov 2021 19:33:48 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <YZWtfGNPAGtHOXZ+@builder.lan>
References: <1635896673-5841-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53ArJSYEAtLbc5dFrPspKhi3Kv=hpu=wS1TMsOWcmz6pw@mail.gmail.com>
 <88a5219e-c82a-87fa-6af3-578238d6027b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88a5219e-c82a-87fa-6af3-578238d6027b@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, freedreno@lists.freedesktop.org, vkoul@kernel.org,
 robh+dt@kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, agross@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org,
 aravindh@codeaurora.org, sean@poorly.run, quic_kalyant@quicinc.coml,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue 16 Nov 10:43 CST 2021, Kuogee Hsieh wrote:

> 
> On 11/15/2021 3:39 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-11-02 16:44:33)
> > > From: Kuogee Hsieh<khsieh@codeaurora.org>
> > > 
> > > Signed-off-by: Kuogee Hsieh<quic_khsieh@quicinc.com>
> > > ---
> > What tree is this based on? I don't see edp_phy upstream for sc7280
> 
> this patch is depend on  --> [PATCH v2 4/4] arm64: dts: qcom: sc7280: add
> edp display dt nodes
> 

But there's a v3 of 3 patches in the patchworks queue, unfortunately I
don't have this in my inbox. Not sure why, but looking at
lore.kernel.org, you didn't use get_maintainers...

Also why are the patches Reported-by: kernel test robot <lkp@intel.com>?

Did lkp tell you that you where missing edp support? ;)


Could you please resubmit the 4 patches together?

Regards,
Bjorn

> it had completed reviewed.
> 
> https://mail.codeaurora.org/?_task=mail&_caps=pdf%3D1%2Cflash%3D0%2Ctiff%3D0%2Cwebp%3D1&_uid=1789&_mbox=INBOX&_action=show
> 
> 
> > 
> > Otherwise, looks good to me.
> > 
> > Reviewed-by: Stephen Boyd<swboyd@chromium.org>
