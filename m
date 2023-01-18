Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D076710C1
	for <lists+freedreno@lfdr.de>; Wed, 18 Jan 2023 03:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B0210E64B;
	Wed, 18 Jan 2023 02:06:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C227010E634
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jan 2023 02:06:31 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id m21so47692992edc.3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Jan 2023 18:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCpYgRmq69b6/9nwI4nlNw5U/U3mYH9SS4rlE1EJHiU=;
 b=sCdC/8rkCqqt/a18OV8/ciuvAtSFzsn5rvwQ6JF7c2X2ONJTikbbOfMQ3qz3SR/tGJ
 dHylXVs1VB2tIor+Y9J8cNOJkg+LIZcwrTD6LXHlH/QI/56TWMFVEzybo3ekpqaIqK2D
 SEoS8IuNBb7QiFEdDQkTJDfcgNsOP908WjbebshzbxMw29Lw+KlU+mZWR8ZaIZu8KJnS
 tB1e/y+YwKojIBFItFhp43Ef7TZnFD1ePImEabJpkbLUIMZt8M/mhXfm3fHOgZx5/J6V
 aabqwtPbWpJjZZwy+5ZDThK8+K6Aj5EEe6kWBhkgRvZoSVC2jWlXA58n4f/oQzdysSut
 Ztfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCpYgRmq69b6/9nwI4nlNw5U/U3mYH9SS4rlE1EJHiU=;
 b=J6vyn3DjB/HckglFzueNyRjAxVxrjAsBNUnauYKst5TBYbWIMPzukKfFePCeu0GtsE
 J2JnB19eJfxi2YeB/J+DpUVhTAhtjCimktUan/lOF0q0ftxIfeZgu9HpZvhU5/J2XzNX
 yKgi0R7K4EUDjk/h/16mxhqyJMh0gtx7lwp+f9uURKRGONCtKLBAmO4i88Da5i3V6vL2
 Kqwx1SelOW3TLoUiPW33F1aOhk5nKL8LXXRxpx0VXAH71Bga4b46eug8+uA76ehVwdHr
 7ZVia07/eXGRTbAEVAPQUSviyUS4lrjVV6dpUNj0ncrd+AQFUE+aOzORAfvM0FaCLXji
 yEEg==
X-Gm-Message-State: AFqh2kphCI/IEFv3alW49nssYypvUmZyNypn5c3OR6p77/aEyCEGull7
 UWuG3AWw9ZKQ5c9KOP9EIgjfGg==
X-Google-Smtp-Source: AMrXdXtm6bVjzMJezwlqrDTZWdefkIkOq3Ckp9lzvxb0zQi9T11yRyysye65sUbvVZdrI/LV7YbkaQ==
X-Received: by 2002:a05:6402:501a:b0:47e:bdb8:9133 with SMTP id
 p26-20020a056402501a00b0047ebdb89133mr6465531eda.38.1674007590289; 
 Tue, 17 Jan 2023 18:06:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 kx1-20020a170907774100b0084d368b1628sm12702694ejc.40.2023.01.17.18.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 18:06:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>
Date: Wed, 18 Jan 2023 04:06:12 +0200
Message-Id: <167400670547.1683873.1210769890022767222.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
References: <20221212091117.43511-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH] drm/msm/gem: Add check for kmalloc
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On Mon, 12 Dec 2022 17:11:17 +0800, Jiasheng Jiang wrote:
> Add the check for the return value of kmalloc in order to avoid
> NULL pointer dereference in copy_from_user.
> 
> 

Applied, thanks!

[1/1] drm/msm/gem: Add check for kmalloc
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d839f0811a31

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
