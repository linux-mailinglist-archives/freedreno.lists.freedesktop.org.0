Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPsHKSHxeWnT1AEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 28 Jan 2026 12:21:05 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE747A0374
	for <lists+freedreno@lfdr.de>; Wed, 28 Jan 2026 12:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E9510E671;
	Wed, 28 Jan 2026 11:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVGNQAqE";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y88GrQCK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D3210E20E
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 11:21:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60S9249R1406340
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 11:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=; b=OVGNQAqEyJXdmDbO
 aX2gznPXCvBCwLJ4xK/OpqjbaCvvSwc1KeNGm/O01eQWMAlYDlKB9OJALSBfeL4r
 9xtn/GECQXB+R9N2zUluP7CwdvXl62t0TYrydk8Hucqk6htd6HktYD+XRIITjTmf
 xccgtRCt1vWAPxHQkm/RVAaCaOGUwwEkvgnSIZbMorPoTOgOqO/j2RaWBHGw62jG
 ri/Oo1v52yjuh8kj/HMK+NQZHy4gT5GrifNZGVKnknxs0OLYqWrawc5RDHl+cGPM
 nl6sOXory+jz3KDsHJ3c03uUOeRdbMJJRHuBarobuF6wiaYcpcbjbtNPwVEfOL+Y
 BlD9Zw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dytjdb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 11:21:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88a262380deso18756086d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jan 2026 03:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769599261; x=1770204061;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
 b=Y88GrQCKPr09GPip56G37i/UoDoDFctZGfx/b9h8zxs+HSXLKPGy6FQK/H/AmMZqG1
 9QmwCmXHFbmG9tzBgl35IWefNS0ko+KrGa8CsSI30VHLPWNRubUWhM1UzLsw66nlF1A8
 m9gk55xbDSG2UAM28/cV2FWUJpI5sHT+jbCxxaTAEyfLMnMqefI4NKLUVIPIRWoW6FxI
 CVUA923OUYdf0nM+f92nOl+sEq1IHBQpHJLNsTXkSoETAaa5Z63B9OIRXyr+CN+jM6oc
 wbM9R53nRZgGUZJ27WIATMUK86aiZVRl+25erszDJamW/YJgZf44CZwuSRSb60qw14Og
 5Wtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769599261; x=1770204061;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1g2tc08NYFOW9PyN0Q/fD1WgNK60ygQO4ur4eDmhFgk=;
 b=dotNyWwPnpyZk1wcyBq/LXqM3JaExNgolvdh7mP721/eCGtXrY51X1SNa0OjrdtTMr
 BI6QMaNcFiNWk02bOzqUeqN8/Tp31Lc7QkyIWXTtpoDTh+UCGU6iHpO+pJ25SWBFxwHm
 KoXgasl8ly1EJpuDLI7WI9s+5wiMWvHE3aJv9I1gyUu4w5OvFqI4gCF0Lv8wAgEljYc8
 3HlZNcdPJXdoyO8t79dZ933xdbc/rnjN/UUapcsgh58qGSWTTaSF4+b47pgGcG4XTtZ/
 lsD82U2F4CErVwQW/rJQ+cVWNF7RmUf1+VTGZOxwwwgtu9KYb3zktVeGO4CnTcyXiU8X
 obXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJXve7vXZ3/YGMfh2gsiTbTRaFz37R2BPq0aE2sfcMSfNH6Vg+3XPbtd1zSvkGaFECZ5vrgXlfdgk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwunWQ2E5qSZB7ENrbxb0duAF33b86RM9LDSOE9sxQ9I7r6fNed
 rp04HsdOwT8DKzieaVsiuvAlCsDwwHB17kZU2zDkRIGjxcCPC2JOQdyw3nCupdLGZ8m4+1iQRjf
 wqGCED0wq2kjPq7J8Vm7xTTGytedK1hAvkIRpk01yYvnI2MDpFXKiWUPXfn6uOePfy8SI21Q=
X-Gm-Gg: AZuq6aItsNi6eA7TWKnjb9tiN6WDzP7nklAMRBzusWOsYa5xhjZnErA13gRXnKa3eci
 AKDx165mn3Qk8z4QUgFEmz/aUqufEQIfXLW5kMHbad/tvOOwual7mxLrqg10bbJjJAszKflbUo1
 txG/rUAfgifwAYpOVymNChjm6fJXI8Mj5u9TJf6VEsEvxr56Oy0MqUOFgyQd3xSeULHmrLHhl9X
 ohpCovWJWmDpAhMdr3bG+9OHqBURRmitv0KKMGKuLgIMP0xS2pVeRJGeMloYG1yrImp4VNSXuiY
 jt0uKed2Nyc1MJAxf2nmMRGPI7cLsyBYSbOA/0p1EdK3PunqX1WzmqQyalqEpNoysrRdBkRZxwH
 fLDo7KBlG/vOS8Pk/d6PeU7P5mT63sawXCzaoRKcvBGK7WsDwFUDjbHNQNMrlEIDtWRk=
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id
 6a1803df08f44-894d786e265mr9868356d6.5.1769599260726; 
 Wed, 28 Jan 2026 03:21:00 -0800 (PST)
X-Received: by 2002:a05:6214:5c92:b0:795:c55c:87de with SMTP id
 6a1803df08f44-894d786e265mr9867946d6.5.1769599260101; 
 Wed, 28 Jan 2026 03:21:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-658b44527eesm1422612a12.9.2026.01.28.03.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 03:20:59 -0800 (PST)
Message-ID: <56b686d8-d526-4e11-9b5b-b98e4f1f72d0@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8650: Add sound DAI prefix for
 DP
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-6-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=6979f11d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=UpTyAFhicMDBmGaZp7IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: HiAgFMriV0ORXEwuYBs20m9O3svvqZPS
X-Proofpoint-ORIG-GUID: HiAgFMriV0ORXEwuYBs20m9O3svvqZPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MiBTYWx0ZWRfX8cMKCWiLjr64
 xVrhQ50+Jkh3ytea1lltTEOrRRtJVvy3tvSbwC7WfkUSps1yL6ojsj4nrOJqNvJ5qf74AyotLsf
 /QIABRtfk5eA+F0B6dZwr7hFKVbCVEtZhSXsOp2S2iUzfU0TVRUdejr/D/DTwayrk3rnb/WnbkK
 sixuuKSNCR5vGvrK+WA+5K8nTQ21Rb4bwFAw3WjEYYtOZm+qXOPvZlwOhTf/yobrAMzpgq6So1P
 3tDJmz3dENB2GIW5dmWdmsAXyAGs7Q9xYjliztV3pIk1ASwulzFes9BiRiNJ+1mA2ayFXb0Io0C
 AezXEuWR6fhQVx0r9OfbAxUo3Fai6aP248yykyyBIKZrioP0Fbn/T/O3E1vE0Vt9OXlzb7kRV3i
 USkQtmCBiVlTa+RfJRY0aoRJk/xE/grloemEd0hpnKms7zC8yEYrY8M/kst7wcUmoVLgZDmB28K
 fCCnJB+APrcDyYdDo9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280092
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: BE747A0374
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
> controller, need to add dedicated prefix for these mixers to avoid
> conflicts and to allow ALSA to properly configure given instance.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
