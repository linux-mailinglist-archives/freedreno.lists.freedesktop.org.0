Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA0wIHG5rmlIIQIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:13:37 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBB7238972
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:13:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BAF10E181;
	Mon,  9 Mar 2026 12:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jHru3esd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I2Fxuc9d";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E7810E4AC
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 09:12:12 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6294f5OM1587512
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xbMtvtdOfLDdatvp+5lzCch6
 oMIueR07h2NcUioWpFw=; b=jHru3esdNzuncTNwyW211a+aJdCkYiYxILsoZN+3
 1GwgTcHiMn/ymHOV08WINAfoWlfYw32mmtmF+Seo9nDBKL/8faTBqtOibVjY8T1b
 dgaY0uA7GYpKzy2BlixGrj6mN62goEwdjRuKoxo3BmtDppXIOIRCT3W6eZFhNujG
 NUVHihFT8lC0N4D4b9D4sUu9vqiYV7661k24lzZtWboU4mtxwP07+llelKSKDhOL
 XCCcln8fcMYU0Dbq9i5aXPPkIr1kAbbwT4ojrN+2XxrTTpUirMmL8EjgT/DODPGl
 DyxQTsHS6r2QOpA4ooTD4DOGq2QorD2Gt3YNLkNIxsnfsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy8u9d-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 09:12:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8cd80bea54dso715453985a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773047531; x=1773652331;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
 b=I2Fxuc9d1lJMy9ORQ+ani6CGOQnMHOpF+gaIyH8erNHErGxl8KFjn9Djvbi9wiJZ7u
 EAM5wptjrYOTkaJJcLqYSOGdnkvx8g6hVSlls3KbqYpXUGSTOwuOGVgPQgQYkB28yhsx
 zo1hwQEqpYXn8vYBNrbgD2UqcK47mw3NDA7TSdl4xU9ArJ3a1bfELns0sVt//SGWY3RQ
 vRg/7hp2MG2d2UqdRUa847PGJaT50TIhEyWz69nsjA7VY02IuEJbthN8Rw07ZfmR8965
 cTuTxSOvEgYD34I1jl4fxG/Q4Tx4Mvr+ITkeKBrsBk2SgSKlqmJsp+juOsrB0pDnMSul
 id7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773047531; x=1773652331;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xbMtvtdOfLDdatvp+5lzCch6oMIueR07h2NcUioWpFw=;
 b=sVolG8ZWUS6eLhFXeigx3ocg5CIH+PfIQ+Jwk3IkEwXUsVzD07sN3iKknJpM8iS/53
 gSReQqUm4nkBqcszYwafLuTMb/j9mxa7QoR6/DuMLCVpTtutG+L9DdGKVYg708Cens1T
 yDT5yy/ZsCE65sb+RlB4f6TouT8qP3uFUzKyUkLiRxOha5h3jOE+K14dhVmOwKWZaF5e
 8XcJWlCXotewwsb6EmPnfWF33fX1v9GEpRWQFIskIXYwj3qSrXFW19j84vQHeZVZarSD
 ul59TWBIUN04TVQ9F7cmgzywK34usQfBYmWKi8vMHuuUCq6NZ+ApAE7nySWUvwkhHFbA
 HvIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcmxxTR2J1GJst2Bzurs9mlOWQWtNejE29OdQKYkoANwjfAFDwvx4MuQcj1AWidfIAlAM/9eCFqk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyR6fbIb7/NE/tkQO6CA99PwuDnjws2P3R8lOt61ScE709/4CX
 Xds5hbYxzfSZRiIsmBn9mYUpgKcPBo0S7n+SoDozIJ9Ln6E/dcNVTAXXh1S/JeMDxRpIu6uA4O2
 Yk38E6D4EiOVnurRyeNyXklALDY80mbHUgGGfhWzop0OYE1K9jd8sdTdvQuGo6dQG988Nld4=
X-Gm-Gg: ATEYQzyXfLLUz/9Rq7PlHSYVDspU4+rYHsHbe3PI5zkHQT2Df+7asIqpWrX62PJ4yrv
 zkvuBdIwyPbf+Emxi2VIq6Eetv1bf4AW2+dT18NQv7ztK6w5i8o55AG92CVyN14M/dZDk07qVW1
 GQfTAX9B10OFmBY6XjviOBbCou/HwL5xFcNnxBWvPegIP0oajf2W3Rj7XqhamanmdfOaOih/8JA
 W+pXevIYrFSyhLFU8H3rf5KTv+veJEATyQMKaUWvR3giLhcPQAX64guSMenmd1gdTwXeFkKk/Je
 EkTZFEtoncma2EuVUfQb9edafCGgCxrwtf/MdW13D0z/Wi73zIkyJ55NZTZpDFMeXJT/SzQ7CKl
 f1j6lmwKmcargxdvfvu271QBii9+lS1bswv5s/rlBNv3tzyM6gM/WbA==
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id
 af79cd13be357-8cd6d4d541dmr1304571285a.63.1773047530919; 
 Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
X-Received: by 2002:a05:620a:700a:b0:8c9:f9c1:5ed with SMTP id
 af79cd13be357-8cd6d4d541dmr1304566385a.63.1773047530429; 
 Mon, 09 Mar 2026 02:12:10 -0700 (PDT)
Received: from trex (110.red-81-38-138.dynamicip.rima-tde.net. [81.38.138.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae483desm23179497f8f.34.2026.03.09.02.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 02:12:09 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 9 Mar 2026 10:12:06 +0100
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
 akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
 elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jjohnson@kernel.org, mathieu.poirier@linaro.org,
 trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
 pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
 tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
 srinivas.kandagatla@oss.qualcomm.com,
 amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
 op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
 skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
Message-ID: <aa6O5tir4kVIe0eZ@trex>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306105027.290375-12-sumit.garg@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4NCBTYWx0ZWRfX1DloTzvO4/wL
 xKx6k4mBUE3FXHosbGhJbbrptokl1h2y0YRbbfqnGCUSKHKtxAf1jaXiCE43w+WZxqGX0FeBA5H
 zH74A6ZhVR2M3I5TBs0i+pMF2dK6bSxc1qHSlFGpakaf5fUtjaohsqL/X/Lqu8U7iijYxZGJep5
 4G9yfHG5/5tR5VbwbbvfaaEjvNkpCudLy3/g/zRtsyfBXiFbJ7rkG82MzokwRinfcmRBhzG7W0s
 2oduFtvZdgqK6x9S/+BhocfdgGMLazwPuiN8EvFXCQzmbqQP7pmvnxsF4nZZO+NVwVFYaY6nf1c
 ivppWNxGmzYw8rJjTV8ekzNF4JOeyWVsvOZNseEyBXVqOXcluFJMJ5ZCoCyLmpSo2ea8EET5+Lw
 0+eFT/R2svIyqRyU1VdEi5Er5ktfIyLduwDpPDOaQmAZlQhmYKlxLM62CoIMBgZBU0C4nqEkMe3
 gUD0IM4hU31SrbzzVsg==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69ae8eec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=P2IcWdTxk7sEx2G8DnB30w==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zah51VvIpe4vvf6E17kA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: hxCLGXQSr3XJpKVMUZ4uo-VPZXfsg9vD
X-Proofpoint-GUID: hxCLGXQSr3XJpKVMUZ4uo-VPZXfsg9vD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090084
X-Mailman-Approved-At: Mon, 09 Mar 2026 12:13:34 +0000
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
X-Rspamd-Queue-Id: EEBB7238972
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jorge.ramirez@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualco
 mm.com,m:jorge.ramirez@oss.qualcomm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorge.ramirez@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[freedreno,dt,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On 06/03/26 16:20:24, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_firmware.c |  9 +++++----
>  drivers/media/platform/qcom/venus/firmware.c     | 11 ++++++-----
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> index 5f408024e967..b3c5281aea91 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/firmware.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/of_address.h>
>  #include <linux/of_reserved_mem.h>
> @@ -79,7 +80,7 @@ int iris_fw_load(struct iris_core *core)
>  		return -ENOMEM;
>  	}
>  
> -	ret = qcom_scm_pas_auth_and_reset(core->iris_platform_data->pas_id);
> +	ret = qcom_pas_auth_and_reset(core->iris_platform_data->pas_id);
>  	if (ret)  {
>  		dev_err(core->dev, "auth and reset failed: %d\n", ret);
>  		return ret;
> @@ -93,7 +94,7 @@ int iris_fw_load(struct iris_core *core)
>  						     cp_config->cp_nonpixel_size);
>  		if (ret) {
>  			dev_err(core->dev, "qcom_scm_mem_protect_video_var failed: %d\n", ret);
> -			qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +			qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  			return ret;
>  		}
>  	}
> @@ -103,10 +104,10 @@ int iris_fw_load(struct iris_core *core)
>  
>  int iris_fw_unload(struct iris_core *core)
>  {
> -	return qcom_scm_pas_shutdown(core->iris_platform_data->pas_id);
> +	return qcom_pas_shutdown(core->iris_platform_data->pas_id);
>  }
>

are the calls to set_remote_state required?
0 is not the IRIS/VENUS remote processor.

If it is legacy, maybe they can be phased out?


>  int iris_set_hw_state(struct iris_core *core, bool resume)
>  {
> -	return qcom_scm_set_remote_state(resume, 0);
> +	return qcom_pas_set_remote_state(resume, 0);
>  }
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 1de7436713ed..3a38ff985822 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -12,6 +12,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_device.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/sizes.h>
>  #include <linux/soc/qcom/mdt_loader.h>
> @@ -58,7 +59,7 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
>  	int ret;
>  
>  	if (core->use_tz) {
> -		ret = qcom_scm_set_remote_state(resume, 0);
> +		ret = qcom_pas_set_remote_state(resume, 0);
>  		if (resume && ret == -EINVAL)
>  			ret = 0;
>  		return ret;
