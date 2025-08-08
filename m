Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C183B1ED83
	for <lists+freedreno@lfdr.de>; Fri,  8 Aug 2025 18:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3E610E1EC;
	Fri,  8 Aug 2025 16:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="P0J1WzYF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2C10E1EC
 for <freedreno@lists.freedesktop.org>; Fri,  8 Aug 2025 16:58:44 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578FusJ9022433
 for <freedreno@lists.freedesktop.org>; Fri, 8 Aug 2025 16:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qXFpbB6msDn6xxOvEXK9e3iI3xqkn8YXyRlwlRPqB4w=; b=P0J1WzYF7f1JOe15
 0YZr9fY3mpoQQaIxSzfY8yhr4NaKJSmMLanxe3EK0Ygz1LOnjnsiXb5M9uO3nx+1
 ShMYNVMH+mDcogcXPp9DdZgiFPHtWC9Vkqo8zNrPGkf2f79qjeODOWuSZT0+Z8d+
 8I2cTzbOxC9CyPWI3KreW09u/Sj3SFaK/8UG73ippj0oaeXbZtLf9zFKpxxpcyi8
 iFC56LDKdeTYwbg4Y/tP3pRNofzwnA1EEmBASWoqpTrIpY9j5cGuI1f9gwrQ5ikI
 RmKMyw53kyeQvq4THJ3ff8JRzQXgwX8ydtw4Tg/6mC0O9+SqNNkDZar7tIs0Nc5I
 ZJzULQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5nd0bj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 16:58:44 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31ecb3a3d0aso2298515a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 09:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754672323; x=1755277123;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qXFpbB6msDn6xxOvEXK9e3iI3xqkn8YXyRlwlRPqB4w=;
 b=ORfN5w4Wo7Soxnnfg+Djobm2Gyd202b69G2+IdWwGbKSOw1A7arIYPm+4Zw3+j/bp5
 DCuRJE1h93z7ou00NjgzZr5uwGATnOFUzkgEjJnhCO/adZeaaJY3DCXvcjA92qCP6XTR
 mhJXJcM3Te31ge8tQo+IOe67UCgufEtjP038YSofKDpbNZGlLKTjeAyP73bSuTq+4gWx
 QJWV7oJAikGp9fMEm69VZ3eJaRpWC2twAnHYhmjCoK5eIMm4LNuaZt6yvK717qnolHRG
 KnvdsK05cSDw2pgjjQn45FuvpgatKp7Ey9O2UK5gbPjI5MRUVHqL2C5zlwDFuJvBDLVN
 yUxQ==
X-Gm-Message-State: AOJu0YwMelOxGdCohdk0Dcj5RgD+Qs4kWZ6FrpbaBedTquMRD1yB542o
 GBCuWxavSuviWN+7rrogQ4OWj+KxZJkQeV9K0QoFyGV5s4sPP2Re4rS3Vqd1br0FaTHSmoeFRTD
 W8yS25+qZUEJ9RmqJKG+D1UY2Jg3lxJSItiLy1u6R3PT4Ps8lKMM/oHKlVBasyGV/L0HBX9PcaY
 rLn6M=
X-Gm-Gg: ASbGncsa7wHHKrD0rqLgQ3pbzJ7qoo5mR5OkVbah5MNEOGs87ie0n7ZuKwyMgtNqEa7
 7P/aoKrWteK249ZBPRkBv/nxoIrHJMUvvt7r1drS2iLUqCpIVSUnODc73uGMndH+9CI7hn6ha0E
 EcuTrvVYgRbebWshh+HUYGtdIiWymPxr7c+ZzGJC+7jct23ohQe4qEfP3L41zvSggwrVwJbscC2
 SQ/hVAC5RBizWS6Qqckw/c8FhYgyWVZk6yfLVJkipYlBAjnm5DICAS8bfI8moxPMAlXDvZ0r+iH
 SWzWKRmER5EEXnysIwIe+f4KJ8814zSio26Q16G9b61teI80fiRavSa64UnNK4t9
X-Received: by 2002:a17:90b:3902:b0:31e:8203:4b9d with SMTP id
 98e67ed59e1d1-32183e4f157mr4872222a91.29.1754672322826; 
 Fri, 08 Aug 2025 09:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE68UW+RJxe41Int+NYieAXiW8DAj79vpq8whRQeaQfPXmEGFrzg2umGW8J3Fwb+WqJGzjD2Q==
X-Received: by 2002:a17:90b:3902:b0:31e:8203:4b9d with SMTP id
 98e67ed59e1d1-32183e4f157mr4872196a91.29.1754672322326; 
 Fri, 08 Aug 2025 09:58:42 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.234.151])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3212df38626sm14789803a91.28.2025.08.08.09.58.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 09:58:41 -0700 (PDT)
Message-ID: <2d54964b-1f60-4a58-8064-567611a3a126@oss.qualcomm.com>
Date: Fri, 8 Aug 2025 22:28:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/msm/adreno: Add support for ACD
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: freedreno@lists.freedesktop.org
References: <aJTL87hBAEtJb3VT@stanley.mountain>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aJTL87hBAEtJb3VT@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=68962cc4 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=YZlS21pjlsXJIaRBoB+Oqw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=DO1Mb1PNLP7J8M_SC-0A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: U2hI6w6c2i43423KnluKTPlKPX8L7grN
X-Proofpoint-ORIG-GUID: U2hI6w6c2i43423KnluKTPlKPX8L7grN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX3GhHIH/dh2yj
 Zq9agxSf3six6O7dENnKHocMlfZmV5j53j4qjmDBRTW6fnNgHbp7NNL0BEXR6t9cEJvKT5XXUHr
 AT42ueXBXl85hgFjiFroP14dhOBRcPyL+K8SQBsaYdaF73WsWfAuLgopBHet4AZalaM0rrLlBSd
 q38i6IBznje+T9rfXhobL7Hw9+3RZqoXTXzgSq6ofGj5x/ZhNn302w80R0nKm1bbw8dKlF9TuAz
 CBfyHJATLZGjNqXzr9WeJi99k7m5QzLxNAzCebq/FMt4lK/uv0pMImoCcKVAQw1NBw5+vBDDDcc
 CPREHXXGJ25W1gDH6Zc4KldPowkYAoCBucVuip6S6gzEobvncVr5P3a8sEjaDMs4U87isHPM1N9
 D0FL0ioQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069
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

On 8/7/2025 9:23 PM, Dan Carpenter wrote:
> Hello Akhil P Oommen,
> 
> Commit b733fe7bff8b ("drm/msm/adreno: Add support for ACD") from Apr
> 19, 2025 (linux-next), leads to the following Smatch static checker
> warning:
> 
> 	drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1700 a6xx_gmu_acd_probe()
> 	error: 'opp' dereferencing possible ERR_PTR()
> 
> drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>     1668 static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>     1669 {
>     1670         struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>     1671         struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
>     1672         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>     1673         struct msm_gpu *gpu = &adreno_gpu->base;
>     1674         int ret, i, cmd_idx = 0;
>     1675         extern bool disable_acd;
>     1676 
>     1677         /* Skip ACD probe if requested via module param */
>     1678         if (disable_acd) {
>     1679                 DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
>     1680                 return 0;
>     1681         }
>     1682 
>     1683         cmd->version = 1;
>     1684         cmd->stride = 1;
>     1685         cmd->enable_by_level = 0;
>     1686 
>     1687         /* Skip freq = 0 and parse acd-level for rest of the OPPs */
>     1688         for (i = 1; i < gmu->nr_gpu_freqs; i++) {
>     1689                 struct dev_pm_opp *opp;
>     1690                 struct device_node *np;
>     1691                 unsigned long freq;
>     1692                 u32 val;
>     1693 
>     1694                 freq = gmu->gpu_freqs[i];
>     1695                 opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> No error checking.

We are passing back a freq which we pulled out from the opp_table a few
lines before this. So it is unlikely that this call would fail.

But it is okay to add a check here if that would make Smatch checker happy.

-Akhil

> 
>     1696                 np = dev_pm_opp_get_of_node(opp);
>     1697 
>     1698                 ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
>     1699                 of_node_put(np);
> --> 1700                 dev_pm_opp_put(opp);
>     1701                 if (ret == -EINVAL)
>     1702                         continue;
>     1703                 else if (ret) {
>     1704                         DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
>     1705                         return ret;
>     1706                 }
>     1707 
>     1708                 cmd->enable_by_level |= BIT(i);
>     1709                 cmd->data[cmd_idx++] = val;
>     1710         }
>     1711 
>     1712         cmd->num_levels = cmd_idx;
>     1713 
>     1714         /* It is a problem if qmp node is unavailable when ACD is required */
>     1715         if (cmd->enable_by_level && IS_ERR_OR_NULL(gmu->qmp)) {
>     1716                 DRM_DEV_ERROR(gmu->dev, "Unable to send ACD state to AOSS\n");
>     1717                 return -EINVAL;
>     1718         }
>     1719 
>     1720         /* Otherwise, nothing to do if qmp is unavailable */
>     1721         if (IS_ERR_OR_NULL(gmu->qmp))
>     1722                 return 0;
>     1723 
>     1724         /*
>     1725          * Notify AOSS about the ACD state. AOSS is supposed to assume that ACD is disabled on
>     1726          * system reset. So it is harmless if we couldn't notify 'OFF' state
>     1727          */
>     1728         ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", !!cmd->enable_by_level);
>     1729         if (ret && cmd->enable_by_level) {
>     1730                 DRM_DEV_ERROR(gmu->dev, "Failed to send ACD state to AOSS\n");
>     1731                 return ret;
>     1732         }
>     1733 
>     1734         return 0;
>     1735 }
> 
> regards,
> dan carpenter

