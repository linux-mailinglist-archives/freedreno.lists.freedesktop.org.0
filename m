Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343EAB1DB11
	for <lists+freedreno@lfdr.de>; Thu,  7 Aug 2025 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F90F10E878;
	Thu,  7 Aug 2025 15:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e4BzJySj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BCF10E878
 for <freedreno@lists.freedesktop.org>; Thu,  7 Aug 2025 15:53:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-455b00339c8so8003395e9.3
 for <freedreno@lists.freedesktop.org>; Thu, 07 Aug 2025 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754582008; x=1755186808; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cyjw1gKrF3O2P3W8+5DK1zWpjGKQibtEY0RDx2hRjCM=;
 b=e4BzJySj72g5R3/2n5Yj5ddSlW0lK9zC9sHKpJg6NEgbfsXBt0xXlmBQy2mAfAwosh
 KPRJTSSquYSUZ+7fR31OiqHMkauRTrITCl+HTB3QYORnKzFxjXll7KEiV8MT1jy6Sb7M
 MwMLXMizhoZ7aBg1wpBdiFqCWLOJrb6jhCno+LogqLz4Ho8BGtZsS9EvKpH7L5g9hMiv
 /oO8BiKJ2yH7ZyVUP+/q5R6VF3OMvhj3ydmIhSnihmJ0Patfuun1r7H6/pIlKptt09Ap
 EbdgwbkMz+NGJA2adtRU/d/8KQy2AswKoR/mPNrBfauSjWTM3ertzbrvldw4N8wiOrUv
 cSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754582008; x=1755186808;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cyjw1gKrF3O2P3W8+5DK1zWpjGKQibtEY0RDx2hRjCM=;
 b=CtfN/mMRrLZRwusYOMeB5XdRP65qMo/lxnyPjJe+8S2cHI8nxk5P98GfPxnDToL2TG
 UYFXHCa5pPwe+yEpnpGINuUsrz9EZQDr6ib8UJxWBfepMnyrBQjUBH1Ikgw9fnGPXJPc
 bmb/ulcyNUURscufsLf2jtEcH8bEve63jHLtRO2xxXazfJGJIUysNHjQuGNvB5J89Ltb
 e8Imyd9eyo36aG60toDyPNxHly+k+pDnF4lo2QNJjL9dXJr+dcXIZJlzGb0zESCm8SLf
 X+KQGdV5Mbnuq4D31x/B/eprDvNprgyfhe540fyMqNBu8J7no4CWP4zMOBLa/6Msfk7X
 GBpA==
X-Gm-Message-State: AOJu0Yx8Rf0is9KZG6PrbD7141Xl7vK9DzbI8kZD/rrNplQwGp0bYz0d
 r4m5aSOJz/U6T6VsVUDyrYJQSze/62l0v04Ds8Gxs0Dk0IbB+HlkZmbeTrBwS7onfkWDXJ51j+f
 CTLxW
X-Gm-Gg: ASbGncsCN2VSKqQcla1i8DlBT4FCiGYDkh+9OurTQsFizoAf3oS53QbsC+NHCgfC4fR
 zJ1LsMYTJnipqT+MvJKZl0GXsVaxXPqUY+Ukwg4/1ukyRN8WXYhlPJpWkgDvubtYmH96EPm9w4c
 3v5eoifXOV0R1BRzV2zQF5fcqWMZeGyHKWqZik8iNk27z8SbCVawbuPqF0fbfheZ2biqxTUUFp7
 /6o6lfoGkgHVLzLAmkBUeKa+N29MKn0H8P1mF3ETUmek0uHp2tGZ4vRiBzJcTqkd2wVH/s2caam
 x6hqdAR5elz33GAobT7cnEp3sIC0/Y59atNQe5mWUDO2eRNAfdEwPxXw2nwBJpcv0rDm9bjrLsV
 sDO0FMGWm+ZH2tQ/PI9BB0kEhYF4=
X-Google-Smtp-Source: AGHT+IE2lnGFfJvIoLF3waF0EBt52QMSWCKREX4gb8a+KSic0eiDWpc5A9160IH9aeU0f/FTeVmqBQ==
X-Received: by 2002:a05:600c:1ca6:b0:458:bfb1:1fc7 with SMTP id
 5b1f17b1804b1-459e707ffd9mr64476075e9.6.1754582008090; 
 Thu, 07 Aug 2025 08:53:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459dcb86d6asm154001305e9.5.2025.08.07.08.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 08:53:27 -0700 (PDT)
Date: Thu, 7 Aug 2025 18:53:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org
Subject: [bug report] drm/msm/adreno: Add support for ACD
Message-ID: <aJTL87hBAEtJb3VT@stanley.mountain>
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

Hello Akhil P Oommen,

Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
19, 2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
	error: 'opp' dereferencing possible ERR_PTR()

drivers/gpu/drm/msm/adreno/a6xx_gmu.c
    1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
    1669 {
    1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
    1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
    1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
    1673         struct msm_gpu *gpu = &adreno_gpu->base;
    1674         int ret, i, cmd_idx = 0;
    1675         extern bool disable_acd;
    1676 
    1677         /* Skip ACD probe if requested via module param */
    1678         if (disable_acd) {
    1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
    1680                 return 0;
    1681         }
    1682 
    1683         cmd->version = 1;
    1684         cmd->stride = 1;
    1685         cmd->enable_by_level = 0;
    1686 
    1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
    1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
    1689                 struct dev_pm_opp *opp;
    1690                 struct device_node *np;
    1691                 unsigned long freq;
    1692                 u32 val;
    1693 
    1694                 freq = gmu->gpu_freqs[i];
    1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
No error checking.

    1696                 np = dev_pm_opp_get_of_node(opp);
    1697 
    1698                 ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
    1699                 of_node_put(np);
--> 1700                 dev_pm_opp_put(opp);
    1701                 if (ret == -EINVAL)
    1702                         continue;
    1703                 else if (ret) {
    1704                         DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
    1705                         return ret;
    1706                 }
    1707 
    1708                 cmd->enable_by_level |= BIT(i);
    1709                 cmd->data[cmd_idx++] = val;
    1710         }
    1711 
    1712         cmd->num_levels = cmd_idx;
    1713 
    1714         /* It is a problem if qmp node is unavailable when ACD is required */
    1715         if (cmd->enable_by_level && IS_ERR_OR_NULL(gmu->qmp)) {
    1716                 DRM_DEV_ERROR(gmu->dev, "Unable to send ACD state to AOSS\n");
    1717                 return -EINVAL;
    1718         }
    1719 
    1720         /* Otherwise, nothing to do if qmp is unavailable */
    1721         if (IS_ERR_OR_NULL(gmu->qmp))
    1722                 return 0;
    1723 
    1724         /*
    1725          * Notify AOSS about the ACD state. AOSS is supposed to assume that ACD is disabled on
    1726          * system reset. So it is harmless if we couldn't notify 'OFF' state
    1727          */
    1728         ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", !!cmd->enable_by_level);
    1729         if (ret && cmd->enable_by_level) {
    1730                 DRM_DEV_ERROR(gmu->dev, "Failed to send ACD state to AOSS\n");
    1731                 return ret;
    1732         }
    1733 
    1734         return 0;
    1735 }

regards,
dan carpenter
