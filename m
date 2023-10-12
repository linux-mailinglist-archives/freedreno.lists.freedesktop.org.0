Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4077C690D
	for <lists+freedreno@lfdr.de>; Thu, 12 Oct 2023 11:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB0210E471;
	Thu, 12 Oct 2023 09:10:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3198D10E471
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 09:10:57 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-31f71b25a99so670268f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 12 Oct 2023 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101855; x=1697706655; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/SD0ghqA+f46JIuv/otTszlqWrZVg/1MVNDFjObCbSc=;
 b=YifDs71dWOrHMNafjvByesdko+haCGNxMh8r8I5Oa4ugt4j/n7I/DEAbrAyab57MD6
 xtlZOp70FtKruDwiHxVth0wsLav3tIZm0wqVCJYo/bQgR6Q//xh/kN+Qbn1/nOqOGbcU
 cdkOCxpYavlpx4O8x+PwMYtkKdy8oxZ2jFAo9V77tCtxV7FzYVkgMPgeigNevj1WkzEE
 K2Q+hiC8NwW/O75wrkrOoLJoVyUXgCIsugOe3xWhYddRcmS0oDlIr/DflPIhS+PhnLPi
 VtF895Arq0nkVArkcoHoGESry0uKdEomExS2yV9RiC6bmi9zgkKAw2Yr2lKIWl7ebOGj
 T7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101855; x=1697706655;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/SD0ghqA+f46JIuv/otTszlqWrZVg/1MVNDFjObCbSc=;
 b=vQ6ICceT9e0lnngB6hQ4XYYsfjXGR/kh1RwJgW1XM2cL3ZYD+j7a71mtJ7g0rNb9bK
 VUZB/IY4XwAVLtVtMMhwqMae3g85PWLRKssAcXsccPJgDAE4OBpQWEKJ7qKhD8qtGULz
 VOVrzJKRtMX28NSz0pjoWOFNw7h3Ir4FFbz0IP9ixI+OGn61AlFTpb8/wCwEzlLhdANY
 9T5fDdN8xEwjFJm1RAROgmFVAt8XD6OSzz8Ae/kT3r31XNaP8b4Xb0qjXBxRBbBiqpvj
 zucgrSIu05JtIwEdKvRILdrI0yjwcbA9fgWycOoI+ElGSiFAFJbUzRu1gOeqeOh+MVYU
 Oe6g==
X-Gm-Message-State: AOJu0YxHI2LYy8vrW3Bk7TkrvnJHcGwhYxjhXyBkci6gnXgkLO0QfPRQ
 JTFjDHQV6DceJOnDXZvOV2zLJQ==
X-Google-Smtp-Source: AGHT+IElnNycLUKx9T7MY+cizlZ2JUNDozNjnF+7DphXS34rTneKgxK+DgVlN70enpXAduZQIZfPXQ==
X-Received: by 2002:a5d:654e:0:b0:31d:db92:31ae with SMTP id
 z14-20020a5d654e000000b0031ddb9231aemr21596947wrv.44.1697101855392; 
 Thu, 12 Oct 2023 02:10:55 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 j16-20020adff010000000b0032008f99216sm17797775wro.96.2023.10.12.02.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:10:54 -0700 (PDT)
Date: Thu, 12 Oct 2023 12:10:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: konrad.dybcio@linaro.org
Message-ID: <de03d47f-27e5-412f-aac0-42d95f6a5501@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [bug report] drm/msm/a6xx: Send ACD state to QMP at GMU
 resume
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hello Konrad Dybcio,

The patch 88a0997f2f94: "drm/msm/a6xx: Send ACD state to QMP at GMU
resume" from Sep 25, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1813 a6xx_gmu_init()
	warn: ignoring unreachable code.

drivers/gpu/drm/msm/adreno/a6xx_gmu.c
    1774         gmu->cxpd = dev_pm_domain_attach_by_name(gmu->dev, "cx");
    1775         if (IS_ERR(gmu->cxpd)) {
    1776                 ret = PTR_ERR(gmu->cxpd);
    1777                 goto err_mmio;
    1778         }
    1779 
    1780         if (!device_link_add(gmu->dev, gmu->cxpd,
    1781                                         DL_FLAG_PM_RUNTIME)) {
    1782                 ret = -ENODEV;
    1783                 goto detach_cxpd;
    1784         }
    1785 
    1786         gmu->qmp = qmp_get(gmu->dev);
    1787         if (IS_ERR(gmu->qmp) && adreno_is_a7xx(adreno_gpu))
    1788                 return PTR_ERR(gmu->qmp);

This should be a goto something_undo_device_link_add;

    1789 
    1790         init_completion(&gmu->pd_gate);
    1791         complete_all(&gmu->pd_gate);
    1792         gmu->pd_nb.notifier_call = cxpd_notifier_cb;
    1793 
    1794         /*
    1795          * Get a link to the GX power domain to reset the GPU in case of GMU
    1796          * crash
    1797          */
    1798         gmu->gxpd = dev_pm_domain_attach_by_name(gmu->dev, "gx");
    1799 
    1800         /* Get the power levels for the GMU and GPU */
    1801         a6xx_gmu_pwrlevels_probe(gmu);
    1802 
    1803         /* Set up the HFI queues */
    1804         a6xx_hfi_init(gmu);
    1805 
    1806         /* Initialize RPMh */
    1807         a6xx_gmu_rpmh_init(gmu);
    1808 
    1809         gmu->initialized = true;
    1810 
    1811         return 0;
    1812 
--> 1813         if (!IS_ERR_OR_NULL(gmu->qmp))
    1814                 qmp_put(gmu->qmp);

Unreachable.  But we don't need to undo the qmp_get() in this funciton
because that's the last failure path.  Do we need to add a qmp_put() to
a6xx_gmu_remove()?  At first glance that looks like the undo function
for a6xx_gmu_init().

    1815 
    1816 detach_cxpd:
    1817         dev_pm_domain_detach(gmu->cxpd, false);
    1818 
    1819 err_mmio:
    1820         iounmap(gmu->mmio);
    1821         if (platform_get_resource_byname(pdev, IORESOURCE_MEM, "rscc"))
    1822                 iounmap(gmu->rscc);
    1823         free_irq(gmu->gmu_irq, gmu);
    1824         free_irq(gmu->hfi_irq, gmu);
    1825 
    1826 err_memory:
    1827         a6xx_gmu_memory_free(gmu);
    1828 err_put_device:
    1829         /* Drop reference taken in of_find_device_by_node */
    1830         put_device(gmu->dev);
    1831 
    1832         return ret;
    1833 }

regards,
dan carpenter
