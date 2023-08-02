Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8176C801
	for <lists+freedreno@lfdr.de>; Wed,  2 Aug 2023 10:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBD410E51B;
	Wed,  2 Aug 2023 08:08:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EF610E51B
 for <freedreno@lists.freedesktop.org>; Wed,  2 Aug 2023 08:08:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fe0c566788so10891744e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 02 Aug 2023 01:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690963733; x=1691568533;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
 b=tMzB48/4AsljrJvI2Ejp29/MrmRT3yKPeEX/DqlKCpOvI4twz4giC1NoKfgL72NFco
 lJufmZSDxWaWNjua3rF8eculMDKzzKA1Q/t7Lc02HGHVTNW7d+JZmfDm5LMt6mbzVLIH
 IjQ4WNxPR/FamtiRyJFqoZkzBYWgT/1I8Je5EUyg8pfGTTgGmCQ6q+N05lF2sRmuoKkf
 ggNDMLDtRdZQnnzrDIEeNv2eh7vx4LT40xMdo4z2V2zRmZmTFdFNUIQPtr7jp7bX7nOM
 6bndKwLX1CDNLsstFPiF+qs9/sUh2+sPn3CzJRUUTmdZgY24j2M83+Bo70GHRH2QksZJ
 BltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690963733; x=1691568533;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aOKmlxAZiu+rAy0mWvKiWQUS7YSnrxxOgJ2e0G73lbg=;
 b=CXNGJFEMQv7B+QjWfWDBqBlqQZXyMD8wMO17VblnJbmv3NT6yQ6qdE6C60jfUyfgPO
 7EYllVtabaYiGEQZOPcn4As4ZBUCFDpOpaoxwfmrZ6tMBnOvUabojbPdu/vJb/5Y9eAg
 xWa7Iy8zH+2pvEW4R5tB7P/soXwWg834PUndvKiKNZ9wumJas+rvsjVsbsPqxuImzVQL
 gaacNrPVC3KgUebMLON4WD6He7Vs4Ox7oQmCoBAEm5MnnE/8fZR+8JfjBysDf0KCrE3U
 fXM+pMzz7z9rLr+crmgKQe6Hvg7Szd5rBBXUG3LyzkXGUbrUWeE82I/Dz876ZerNs7Wf
 iprg==
X-Gm-Message-State: ABy/qLbNaYhYdh8CLnPBxecakzTIjJROXMxGWBK9+ZrE+K3On/CD7Cug
 Z5g9ne1MIifEWYdk020dKXvaXw==
X-Google-Smtp-Source: APBJJlFG++b4mOehT6ZE3FkFUr1jz2i+ns16PIZMvzWbhnmLx8s6v/p8aB2VxEB9+qh6r9g8T5sPww==
X-Received: by 2002:a05:6512:104e:b0:4fd:fc36:68a2 with SMTP id
 c14-20020a056512104e00b004fdfc3668a2mr4674646lfb.1.1690963732826; 
 Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196?
 ([2a01:e0a:982:cbb0:c5bb:5b4:61e3:d196])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a7bcc88000000b003fbcdba1a52sm1006994wma.3.2023.08.02.01.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Aug 2023 01:08:52 -0700 (PDT)
Message-ID: <9caeb91f-1277-3645-cbbb-7be538d80e2a@linaro.org>
Date: Wed, 2 Aug 2023 10:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230802011845.4176631-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 1/3] drm/display: add transparent bridge
 helper
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry,

On 02/08/2023 03:18, Dmitry Baryshkov wrote:
> Define a helper for creating simple transparent bridges which serve the
> only purpose of linking devices into the bridge chain up to the last
> bridge representing the connector. This is especially useful for
> DP/USB-C bridge chains, which can span across several devices, but do
> not require any additional functionality from the intermediate bridges.

Can you CC me on the whole patchset ?

Thanks,
Neil


<snip>

