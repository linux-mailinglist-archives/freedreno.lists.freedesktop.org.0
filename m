Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EA0A596DA
	for <lists+freedreno@lfdr.de>; Mon, 10 Mar 2025 14:59:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACD410E298;
	Mon, 10 Mar 2025 13:59:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pezYgOk6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DEF10E298
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 13:59:17 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43bc4b16135so24822325e9.1
 for <freedreno@lists.freedesktop.org>; Mon, 10 Mar 2025 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741615156; x=1742219956; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ppfwn2QQfECUfr6VWbo/Er8VHdHAsKrXKFLiNhCsl+4=;
 b=pezYgOk6y3C4mIGFrM/dt4QEaNjMoeW7K2v6BUmSx3NXervjyK9xPb6cURubNXlSov
 j2JtztdjaxmmVKqmcZsDvLHD13BW891IQ2JeZnR1Ch4LSAVlKC38BJqFErUWYHnDB4Iu
 VGJkPm434zprsNfzH9hYMJCMLg5p2SVireMkSgRAQoTtP+i+SuX/zijtjVzK+wCleizC
 Tq0bpXkH6mxb88nWKGaYmqzxU0vWfKbABm9LfIh8dZpYzDddguAC6LJ1+ht4URuzeIMg
 se04MVDa8QoOiwYTxR0gnCIxGnpvq1JlsT4yblWbT5NcJqX0Sbg1h+yVZxnoUDErBpry
 yPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741615156; x=1742219956;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ppfwn2QQfECUfr6VWbo/Er8VHdHAsKrXKFLiNhCsl+4=;
 b=ZToRYfOcbnYbiX9i2BngPO9RJXanIL9KKKBUqo53aNhc4qOCK5wU++kx91Y9O+lh99
 +ca2J297ytA4gLkJ09IGjqgMr9WweVusxjeUuhqUFPSc8WqL29I0Rh3/bfjkL0T3FxY9
 cyBMEHqgAbLiW3B4FzMwtkme6Y/UWSgiR0kvu2ovwvfzam0lS+fnaCmIwfb1Gwf9fBIs
 4nYIZqnD414bpBhT261xQfDCBqz1sfVJNoGZFh2IZXK6Gx41Ie92AA6YoDeaboMOO4Fu
 0loNN74WM6W1MQP7Gu5XUL8GKSWkarsRP9IQCr26uNklqenI7PSBBbDU0VHRwSGfvHRp
 GMdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1xZ7/Jsvd3ZLG6EjAEvVspjo/+y6qiq/oVQRzi/anjMZJH0J5JCg3RrOUYADAfZSal7G+usk9i1w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzycBPPdJQvkovjfzCKFts+Sc5N2zo71fq0MNluGStEsbnk83F9
 ZOhEYtyySYUJxs4fGdXqu7hkRPlktLjY8n0F5nzNEPjbuDdMQ7fBtpgmhILELuo=
X-Gm-Gg: ASbGncs+HLvTQorZw+236WeWg3a/KxuZ02vh/k2ueOFoSFKM0Zp53S5S3lRaVpy/pl2
 doPgKxr6/uQIxXdzP63CiOzWU/PzDRCqcKEWKaQNZJq1Cdy5AQdBVxzX0oYc5qHwDfwaI/XGIpU
 0M0L2tUaaB5nTcrmTDihVa2ZJai76k2/k8jVcgGZ7fYYv0WRwxJqoKWlCHdUJYMvFMGjHblGECT
 t9D1B+H7JPuEUv5gj2nZ94SkrSmvqN9/tnStoqqL2XN4YIFaNVA2QMss9y/PYhdj0KPllZ3pNy4
 O05Fx9KfBDuayu5G3EOOHQdP6T3EjRh6KOaB5NJ5jzcWROHqpg==
X-Google-Smtp-Source: AGHT+IHhlPge1QdiXNWDLFdy1b+GATvLkusfheev4kJ9+6b7/X0g+edMS2rZmPk8kSvKobX3NbWCJA==
X-Received: by 2002:a05:600c:4f0c:b0:43c:eeee:b706 with SMTP id
 5b1f17b1804b1-43ceeeeb95amr31294145e9.24.1741615156074; 
 Mon, 10 Mar 2025 06:59:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-43bdd8c28f5sm145821965e9.9.2025.03.10.06.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 06:59:15 -0700 (PDT)
Date: Mon, 10 Mar 2025 16:59:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/a6xx: Introduce GMU wrapper support
Message-ID: <7129575c-28ce-48be-9c4d-201f8d6741fb@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Konrad Dybcio,

Commit 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
from Jun 16, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1844 a6xx_gmu_wrapper_init()
	warn: 'gmu->cxpd' can also be NULL

drivers/gpu/drm/msm/adreno/a6xx_gmu.c
    1790 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
    1791 {
    1792         struct platform_device *pdev = of_find_device_by_node(node);
    1793         struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
    1794         int ret;
    1795 
    1796         if (!pdev)
    1797                 return -ENODEV;
    1798 
    1799         gmu->dev = &pdev->dev;
    1800 
    1801         ret = of_dma_configure(gmu->dev, node, true);
    1802         if (ret)
    1803                 return ret;
    1804 
    1805         pm_runtime_enable(gmu->dev);
    1806 
    1807         /* Mark legacy for manual SPTPRAC control */
    1808         gmu->legacy = true;
    1809 
    1810         /* Map the GMU registers */
    1811         gmu->mmio = a6xx_gmu_get_mmio(pdev, "gmu");
    1812         if (IS_ERR(gmu->mmio)) {
    1813                 ret = PTR_ERR(gmu->mmio);
    1814                 goto err_mmio;
    1815         }
    1816 
    1817         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");

dev_pm_domain_attach_by_name() sure seemse like it can return NULL.

    1818         if (IS_ERR(gmu->cxpd)) {
    1819                 ret = PTR_ERR(gmu->cxpd);
    1820                 goto err_mmio;
    1821         }
    1822 
    1823         if (!device_link_add(gmu->dev, gmu->cxpd, DL_FLAG_PM_RUNTIME)) {

If it did then device_link_add() then this would fail

    1824                 ret = -ENODEV;
    1825                 goto detach_cxpd;
    1826         }
    1827 
    1828         init_completion(&gmu->pd_gate);
    1829         complete_all(&gmu->pd_gate);
    1830         gmu->pd_nb.notifier_call = cxpd_notifier_cb;
    1831 
    1832         /* Get a link to the GX power domain to reset the GPU */
    1833         gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
    1834         if (IS_ERR(gmu->gxpd)) {
    1835                 ret = PTR_ERR(gmu->gxpd);
    1836                 goto err_mmio;
    1837         }
    1838 
    1839         gmu->initialized = true;
    1840 
    1841         return 0;
    1842 
    1843 detach_cxpd:
--> 1844         dev_pm_domain_detach(gmu->cxpd, false);
                                      ^^^^^^^^^
And this would crash.

    1845 
    1846 err_mmio:
    1847         iounmap(gmu->mmio);
    1848 
    1849         /* Drop reference taken in of_find_device_by_node */
    1850         put_device(gmu->dev);
    1851 
    1852         return ret;
    1853 }

regards,
dan carpenter
