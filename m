Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4E0JD50jnWkkNAQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:49 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD01818E1
	for <lists+freedreno@lfdr.de>; Tue, 24 Feb 2026 05:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4910E4A7;
	Tue, 24 Feb 2026 04:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdwG3hYc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AUKHMs17";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EFF10E4B3
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:45 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61O3VBbl1143798
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=; b=pdwG3hYcHcMxuaSU
 J5t7Yu06KtVzejenTVsRFAjiyyxcuwV7DhTVHSGQ/2LutpuOZ3T+eqjGzLuW3Pge
 JFIWZ+JIArcDUrC/X/Z0tUSUYFyAw5ljFdbP3ox6QkOlxnjHfgmKhyjfhuQKWAt5
 YCQR0lzKrLXOHxF0/tI+CPfcsD1k8o/yV2+sPhHXptgQ+1XbTi7DYwKUwv+pR9Kc
 pSBVksdUB+SrxyCMAQ1dVkavDVvF+VkE8xxB4xqfpPzPCOX+M9nb0uu5zNORbHFb
 68aSylzm4SrSxxQGgsAUI9fzewNJQdE/mrQMQcvPkdFrvcPuFPcWdpVD9juthPmD
 Ej5D1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568378-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 04:05:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-896f4dcef67so720091146d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Feb 2026 20:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771905944; x=1772510744;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=;
 b=AUKHMs17IiHVu2SrlQFhmAlwuNv5NGVRc0SOx9cVROS/rBym4bM1aEKZvexnU06crv
 F7n9tPEnoVrV4bVLCcHWNBsH2NBaZYzO+3L66gftnMxC7xWeMfpI1fLAmY0fLapkhyz3
 /GxoO70h1nXcWXc0S6AgeyUhK+nq3SCGYC3sj2z5X3cq6v1NaTYx78Utpz4amMR59RLz
 7SfMd4OdRHGLe7FEvjbF9LQBVvq37Nn++YRkGeBqbmAPbcQycCtSbINHcbBiO5Y+JpQ6
 Ujkc+lc1R/9U6pvw/XxuyG7I5SI1TmkecrcsRaRosLD4Vxj3aLPCfFM0gVGx8QTKAgAs
 LB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771905944; x=1772510744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tMipfL5l8lkGuOJbyYr9egIFPHc4nyVIjN+uSQ6jhjo=;
 b=tJFp1GOgE29RFJNJmes9NXlT8PQiaVFca5pU0d5d0PtbEEAFCOAs9/cggzC/8trR2U
 G3i/nvM/+BospRTM1qOwt5otCfSmWBbWWHYfceGIqZy9/WDeFPHBAdmIgDtDcTJMV6RH
 pZpSAA5bFjdJyKRkzUUmxGtsW8CzZ6Sz0fC7/8o2PWx2RwO40mDujJ2HCuUn9usKEmVk
 dyK5fIC5SQ34N+MqDeb2Wyj02ksR62wjmfVbAIbH2VwJySNOFRCeO8g6B86l76Gn4uS7
 q+5BVX5eDBfcbzRu4F1zIcw70qwdmiNvbBE0ZZhfgkgesW0ZFyxKqqQeUc53nMfT8tSq
 Sr5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1CXc+Va7GEcliamaMgZKbmapnyZhFW7OPaF0NrnbGUbM8VVNVfqW9XaTXkV+cjrn6pwvOlQzCBqo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG69cjFCkHUSVPhWdcIZZsqfJwk/5gMlh0wsULOQ2LRdpJ90Lw
 iyH9DlJU6AAWV+NpBcS7p8FSLV2/wW8m7TRHJOGpIZPncqJSRzl3MUDKpjp3p6Tb0Lz00p4PGbZ
 LMc/pJgmDguR08ZB1TG7tmbanA8r9obGTkriIBBaa5Mr4stO+eRt9l64V9JW9J+mlHY6rUis=
X-Gm-Gg: AZuq6aLL2glpBiHtjnk9xvCVtPpJ/q+LGaJOy7QRcPPHP+k/YQHbrGYN1zOpRnFsrCj
 yWfhlLR67cAw27yigMtc3CkmyNRosXBd8Qof7A4DGRgdMRlKS/uUaQqP6CVkBeyJFY+hJqJ3dxf
 ajGKySm3oIWxrltYWMwx8oBlKi96A+kLfLwuas/E5Jc0akqqvKH6hS38cWeyUsRWN273u5XIcVF
 +Lc/W+Rs7TyyoVFQS6OyJ0/CDqHjZbYaBR6omU6oxr9Lr2y5OTUrXtLGUzDUQK5CLI6LLeaDCBa
 wj5YNbTqvNu/eZRUwBz8QCQoEvwQq19eYJen3MscsfaIJyNh8ejd+H7NfZzu3ceiBd160RQKdFO
 OzdCoZ4k6WV/L6I9FkW5CKhatfUHNUJNV2p5T6HQhBinAXwl6687ks3sLx9xqFT6Ad6tmFuXClR
 lL53zmdVpRI7MHjF1G+pmJFVT5lYiaEG+yHZM=
X-Received: by 2002:a05:620a:bc2:b0:8ca:4288:b168 with SMTP id
 af79cd13be357-8cb8ca6e616mr1468291985a.42.1771905943751; 
 Mon, 23 Feb 2026 20:05:43 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8ca:4288:b168 with SMTP id
 af79cd13be357-8cb8ca6e616mr1468290085a.42.1771905943358; 
 Mon, 23 Feb 2026 20:05:43 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a0eeb4c530sm1913135e87.83.2026.02.23.20.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 20:05:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Don't use %pK through printk (again)
Date: Tue, 24 Feb 2026 06:05:28 +0200
Message-ID: <177190591478.429979.1949175178030065433.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
References: <20260223-restricted-pointers-msm-v1-1-14c0b451e372@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eZ0kRoFxOObVGe00yX9qqJKcdetTuQvo
X-Proofpoint-ORIG-GUID: eZ0kRoFxOObVGe00yX9qqJKcdetTuQvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAzMSBTYWx0ZWRfX0oUe7/5ULyHe
 O1xzOmW0CQhE3M+fhEeGI/MrC9e2VKdJuADpV/R36Mv3HZKl6agMpfAwcZns4OW8t4pplrJbbcZ
 7dQGVXs2c/lLh8kypDLQrb8B/BhqPU8+QA4SrBq9tZVrmynUKvXYYSC+tXYL65ZGZCTgdCdjRDT
 s1cdvKMOjuNgeIyDHGxJN6SvD9k/b3EcW7iaY7CWSgBOTh7+Bcd09OKZEmalrBpvGE56x291IR2
 0S78NZGe61DJbMq8c8FKG7PZ3vGfsrej2/cwrKwfi0Qf1AJX9FWNX3zydKn7BMdqi2H6cdDIVRL
 iSrUv+sNEwdjtdhBW2Zw0hOVZDjcoeh96IlNbULQ7xuuXcowIvVaPUan0QKn+VPuQo7wM7rhUly
 F9grSxnlPf6bpc84Xalwyxjaf84EyDVHenuX5lxlj3KWHCLDPJ+2X2p01eI6tinYu5u3sV1oFrJ
 cKv42A9L6AkIaxlbGOw==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d2398 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=e5mUnYsNAAAA:8
 a=_ym-YgABFaPYJePyZlUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240031
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:thomas.weissschuh@linutronix.de,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: D5FD01818E1
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 08:16:55 +0100, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Don't use %pK through printk (again)
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5886cc8f895b

Best regards,
-- 
With best wishes
Dmitry


